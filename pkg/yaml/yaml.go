package yaml

import (
	"net/http"
	"net/url"

	"github.com/zoomoid/go-autoindex/pkg/autoindex"
	"gopkg.in/yaml.v2"
	"k8s.io/klog/v2"
)

type yamlEntry struct {
	Name string `json:"name,omitempty"`

	Path string `json:"path,omitempty"`
	URL  string `json:"url,omitempty"`

	IsDirectory bool `json:"isDirectory,omitempty"`
	IsFile      bool `json:"isFile,omitempty"`

	Size string `json:"size,omitempty"`
}

func YAMLEntry(e autoindex.Entry, baseUrl *url.URL) yamlEntry {
	baseUrl.Path = e.Path

	return yamlEntry{
		Name:        e.Name,
		Path:        e.Path,
		URL:         baseUrl.String(),
		IsDirectory: e.IsDirectory,
		IsFile:      e.IsFile,
		Size:        e.Size,
	}
}

func Handle(es []autoindex.Entry, w http.ResponseWriter, req *http.Request) {
	ee := make([]yamlEntry, len(es))
	for idx, e := range es {
		ee[idx] = YAMLEntry(e, req.URL)
	}

	b, err := yaml.Marshal(ee)
	if err != nil {
		w.WriteHeader(500)
		msg := `failed to marshal YML entries`
		w.Write([]byte(msg))
		klog.ErrorS(err, msg)
		return
	}
	w.Header().Add("Content-Type", "application/yaml; charset=utf-8")

	w.Write(b)
}
