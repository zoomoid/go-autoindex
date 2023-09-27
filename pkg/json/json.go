package json

import (
	"encoding/json"
	"net/http"
	"net/url"

	"github.com/zoomoid/go-autoindex/pkg/autoindex"
	"k8s.io/klog/v2"
)

type jsonEntry struct {
	Name string `json:"name,omitempty"`

	Path string `json:"path,omitempty"`
	URL  string `json:"url,omitempty"`

	IsDirectory bool `json:"is_directory,omitempty"`
	IsFile      bool `json:"is_file,omitempty"`

	Size string `json:"size,omitempty"`
}

func JSONEntry(e autoindex.Entry, baseUrl *url.URL) jsonEntry {
	baseUrl.Path = e.Path

	return jsonEntry{
		Name:        e.Name,
		Path:        e.Path,
		URL:         baseUrl.String(),
		IsDirectory: e.IsDirectory,
		IsFile:      e.IsFile,
		Size:        e.Size,
	}
}

func Handle(es []autoindex.Entry, w http.ResponseWriter, req *http.Request) {
	ee := make([]jsonEntry, len(es))
	for idx, e := range es {
		ee[idx] = JSONEntry(e, req.URL)
	}

	b, err := json.Marshal(ee)
	if err != nil {
		w.WriteHeader(500)
		msg := `failed to marshal YML entries`
		w.Write([]byte(msg))
		klog.ErrorS(err, msg)
		return
	}
	w.Header().Add("Content-Type", "application/json; charset=utf-8")

	w.Write(b)
}
