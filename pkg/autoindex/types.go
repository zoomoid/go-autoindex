package autoindex

type Format int

const (
	FormatHTML Format = iota
	FormatXML
	FormatJSON
	FormatYAML
)

func (f Format) String() string {
	return []string{"html", "xml", "json", "yaml"}[f]
}

type Options struct {
	ExactSize bool
	Format    Format
}

type Entry struct {
	Name string

	EscapedURI  string
	EscapedHTML string

	Path string

	IsDirectory bool
	IsFile      bool

	Size string
}
