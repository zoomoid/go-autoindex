package xml

import (
	"encoding/xml"
	"net/url"
	"testing"

	"github.com/zoomoid/go-autoindex/pkg/autoindex"
)

func TestXML(t *testing.T) {
	u, _ := url.Parse("http://localhost:8080")
	t.Run("singular entry", func(t *testing.T) {

		e := XMLEntry(autoindex.Entry{
			Name:        "01_How Did We Get Here.mp3",
			EscapedURI:  "01_How%20Did%20We%20Get%20Here.mp3",
			EscapedHTML: "01_How Did We Get Here.mp3",
			Path:        "/2023/all-things-must-end/pre-renders/2023-09-22/01_How Did We Get Here.mp3",
			IsDirectory: false,
			IsFile:      true,
			Size:        "3.6 MB",
		}, u)

		b, _ := xml.MarshalIndent(e, "", "  ")

		t.Log(string(b))
	})
	t.Run("multiple entry", func(t *testing.T) {

		type entries struct {
			Entries []entry `xml:"entries"`
		}

		e := []entry{XMLEntry(autoindex.Entry{
			Name:        "01_How Did We Get Here.mp3",
			EscapedURI:  "01_How%20Did%20We%20Get%20Here.mp3",
			EscapedHTML: "01_How Did We Get Here.mp3",
			Path:        "/2023/all-things-must-end/pre-renders/2023-09-22/01_How Did We Get Here.mp3",
			IsDirectory: false,
			IsFile:      true,
			Size:        "3.6 MB",
		}, u), XMLEntry(autoindex.Entry{
			Name:        "01_How Did We Get Here.mp3",
			EscapedURI:  "01_How%20Did%20We%20Get%20Here.mp3",
			EscapedHTML: "01_How Did We Get Here.mp3",
			Path:        "/2023/all-things-must-end/pre-renders/2023-09-22/01_How Did We Get Here.mp3",
			IsDirectory: false,
			IsFile:      true,
			Size:        "3.6 MB",
		}, u)}

		b, _ := xml.MarshalIndent(entries{Entries: e}, "", "  ")

		t.Log(string(b))
	})

}
