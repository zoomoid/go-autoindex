package main

import (
	"context"
	"crypto/tls"
	"embed"
	"errors"
	"flag"
	"fmt"
	"io/fs"
	"net/http"
	"os"
	"os/signal"
	"path/filepath"
	"strings"
	"syscall"
	"time"

	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
	"github.com/zoomoid/go-autoindex/pkg/autoindex"
	"github.com/zoomoid/go-autoindex/pkg/cmd/profiling"
	cmdutils "github.com/zoomoid/go-autoindex/pkg/cmd/utils"
	"github.com/zoomoid/go-autoindex/pkg/html"
	"github.com/zoomoid/go-autoindex/pkg/json"
	"github.com/zoomoid/go-autoindex/pkg/xml"
	"github.com/zoomoid/go-autoindex/pkg/yaml"

	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"k8s.io/klog/v2"
)

var (
	Build   string = ""
	Version string = "v0.0.0-dev.0"
)

func main() {
	c := NewDefaultServerCommand()
	if err := c.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

var (
	//go:embed assets
	content embed.FS
)

type ServerOptions struct {
	Root   string
	Listen string

	CertificateFile string
	PrivateKeyFile  string

	ExactSize bool

	UseH2C bool

	cmdutils.StreamOptions

	args []string

	tls *tls.Certificate
}

var _ cmdutils.CommandOptions = &ServerOptions{}

func NewDefaultServerCommand() *cobra.Command {
	return NewServerCommand(ServerOptions{
		StreamOptions: cmdutils.DefaultStreams(),
	})
}

func NewServerCommand(o ServerOptions) *cobra.Command {
	rootCmd := &cobra.Command{
		Use:   "server",
		Short: "",
		Long:  "",
		PersistentPreRunE: func(cmd *cobra.Command, args []string) error {
			return profiling.InitProfiling()
		},
		PersistentPostRunE: func(*cobra.Command, []string) error {
			if err := profiling.FlushProfiling(); err != nil {
				return err
			}
			return nil
		},
		Run: func(cmd *cobra.Command, args []string) {
			cmdutils.CheckErr(o.Complete(cmd, args))
			cmdutils.CheckErr(o.Validate())
			cmdutils.CheckErr(o.Run())
		},
	}

	flags := rootCmd.PersistentFlags()
	profiling.AddFlags(flags)
	o.addServerFlags(flags)

	klog.InitFlags(flag.CommandLine)
	return rootCmd
}

func (o *ServerOptions) addServerFlags(flags *pflag.FlagSet) {
	flags.StringVar(&o.Root, "root", ".", "Root from which to serve files")
	flags.StringVar(&o.Listen, "listen", "[::]:80", "Root from which to serve files")
	flags.StringVar(&o.CertificateFile, "certificate", "", "TLS certificate file")
	flags.StringVar(&o.PrivateKeyFile, "private-key", "", "TLS certificate file")
	flags.BoolVar(&o.UseH2C, "use-h2c", false, "use HTTP/2 plaintext server instead of HTTP/2 with mandatory TLS")
	flags.BoolVar(&o.ExactSize, "exact-size", false, "Display exact size in bytes for regular files")
}

func (o *ServerOptions) Complete(cmd *cobra.Command, args []string) error {
	o.args = args
	return nil
}

func (o *ServerOptions) Validate() error {
	if o.CertificateFile != "" && o.PrivateKeyFile != "" {
		tls, err := tls.LoadX509KeyPair(o.CertificateFile, o.PrivateKeyFile)
		if err != nil {
			return err
		}
		o.tls = &tls
	}

	return nil
}

func (o *ServerOptions) Run() error {
	klog.InfoS("Starting go-autoindex server", "version", Version, "build", Build)

	mux := http.NewServeMux()

	i, err := autoindex.NewIndexer(o.Root, autoindex.Options{
		ExactSize: o.ExactSize,
	})
	if err != nil {
		return fmt.Errorf("failed to create indexer, %w", err)
	}

	tmpl, err := html.ParseTemplate()
	if err != nil {
		return fmt.Errorf("failed to parse html template, %w", err)
	}

	mux.Handle("/public/", http.StripPrefix("/public/", http.FileServer(http.FS(content))))

	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var msg string
		var code int = 200
		path := r.URL.Path

		defer func() {
			klog.Infof("%d - %s - %s", code, path, msg)
		}()
		absPath := i.Root() + path

		f, err := os.Open(absPath)
		if err != nil {
			msg, code := toServeError(err)
			http.Error(w, msg, code)
			return
		}
		defer f.Close()

		d, err := f.Stat()
		if err != nil {
			msg, code = toServeError(err)
			http.Error(w, msg, code)
			return
		}

		if d.IsDir() {
			entries, err := i.Index(path)
			if err != nil {
				msg, code = toIndexError(err)
				http.Error(w, msg, code)
				return
			}

			dir := filepath.Base(path)
			accept := strings.Split(r.Header.Get("Accept"), ",")

			for _, ct := range accept {
				cct := strings.Split(ct, ";")
				switch cct[0] {
				case MIMEApplicationJSON, "application/*":
					json.Handle(entries, w, r)
					return
				case MIMETextXML, MIMEApplicationXML:
					xml.Handle(entries, w, r)
					return
				case MIMEApplicationYAML:
					yaml.Handle(entries, w, r)
					return
				case MIMETextHTML, "*/*", "text/*":
					html.Handle(tmpl, html.TemplateData{
						Title:     fmt.Sprintf("Files in %s", path),
						Directory: dir,
						Entries:   entries,
					}, w, r)
					return
				default:
					continue
				}
			}
			return
		}

		http.ServeFile(w, r, absPath)
	})

	srv := &http.Server{
		Addr:    o.Listen,
		Handler: mux,
	}
	if o.tls != nil {
		go func() {
			klog.InfoS("starting http/2 server", "addr", srv.Addr)
			if err := srv.ListenAndServeTLS(o.CertificateFile, o.PrivateKeyFile); err != nil {
				if !errors.Is(err, http.ErrServerClosed) {
					// cannot return from here, because of goroutine
					klog.ErrorS(err, "http server stopped")
					os.Exit(1)
				}
			}
		}()
	} else {
		if o.UseH2C {
			h2s := &http2.Server{}
			srv.Handler = h2c.NewHandler(mux, h2s)
		}
		go func() {
			klog.InfoS("starting http server", "addr", srv.Addr)
			if err := srv.ListenAndServe(); err != nil {
				if !errors.Is(err, http.ErrServerClosed) {
					// cannot return from here, because of goroutine
					klog.ErrorS(err, "http server stopped")
					os.Exit(1)
				}
			}
		}()
	}

	// Wait for interrupt signal to gracefully shutdown the server with
	// a timeout of 5 seconds.
	quit := make(chan os.Signal, 2)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	klog.Info("Shutting down server...")
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		klog.Fatal("Server shutdown:", err)
	}

	return nil
}

func toServeError(err error) (msg string, httpStatus int) {
	if errors.Is(err, fs.ErrNotExist) {
		return "404 page not found", http.StatusNotFound
	}
	if errors.Is(err, fs.ErrPermission) {
		return "403 Forbidden", http.StatusForbidden
	}
	// Default:
	return "500 Internal Server Error", http.StatusInternalServerError
}

func toIndexError(err error) (msg string, httpStatus int) {
	e := fmt.Errorf("failed to index directory, %w", err)
	return e.Error(), http.StatusInternalServerError
}

const (
	MIMETextXML         = "text/xml"
	MIMETextHTML        = "text/html"
	MIMETextPlain       = "text/plain"
	MIMEApplicationXML  = "application/xml"
	MIMEApplicationJSON = "application/json"
	MIMEApplicationYAML = "application/yaml"
)
