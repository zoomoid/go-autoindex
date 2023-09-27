package html

import (
	_ "embed"
	"net/http"

	"html/template"

	"github.com/zoomoid/go-autoindex/pkg/autoindex"
)

var (
	//go:embed index.html.tpl
	templateFile string
)

type TemplateData struct {
	Title string

	Directory string

	Entries []autoindex.Entry
}

func ParseTemplate() (*template.Template, error) {
	tpl, err := template.New("index.html").Parse(templateFile)
	return tpl, err
}

func Handle(template *template.Template, data TemplateData, w http.ResponseWriter, req *http.Request) {
	template.ExecuteTemplate(w, "index.html", data)
}
