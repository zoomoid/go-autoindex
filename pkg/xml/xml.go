package xml

import (
	"encoding/xml"
	"net/http"
	"net/url"

	"github.com/zoomoid/go-autoindex/pkg/autoindex"
	"k8s.io/klog/v2"
)

type entry struct {
	Name string `xml:"name,omitempty"`

	Path string `xml:"path,omitempty"`
	URL  string `xml:"url,omitempty"`

	IsDirectory bool `xml:"isDirectory,omitempty"`
	IsFile      bool `xml:"isFile,omitempty"`

	Size string `xml:"size,omitempty"`
}

func XMLEntry(e autoindex.Entry, baseUrl *url.URL) entry {
	baseUrl.Path = e.Path

	return entry{
		Name:        e.Name,
		Path:        e.Path,
		URL:         baseUrl.String(),
		IsDirectory: e.IsDirectory,
		IsFile:      e.IsFile,
		Size:        e.Size,
	}
}

func Handle(es []autoindex.Entry, w http.ResponseWriter, req *http.Request) {
	ee := make([]entry, len(es))
	for idx, e := range es {
		ee[idx] = XMLEntry(e, req.URL)
	}

	type entries struct {
		Entries []entry `xml:"entries"`
	}

	b, err := xml.MarshalIndent(entries{Entries: ee}, "", "	")
	if err != nil {
		w.WriteHeader(500)
		w.Write([]byte(`failed to marshal XML entries`))
		klog.ErrorS(err, "failed to marshal XML entries")
		return
	}
	w.Header().Add("Content-Type", "application/xml; charset=utf-8")

	w.Write([]byte(xml.Header))
	w.Write(b)
}
