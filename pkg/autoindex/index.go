package autoindex

import (
	"fmt"
	"html"
	"net/url"
	"os"
	"path/filepath"
	"strings"

	"github.com/dustin/go-humanize"
)

type Indexer struct {
	Options

	root string
}

func NewIndexer(root string, o Options) (*Indexer, error) {
	absRoot, err := filepath.Abs(root)
	if err != nil {
		return nil, err
	}

	return &Indexer{
		root:    absRoot,
		Options: o,
	}, nil
}

func (i *Indexer) Root() string {
	return i.root
}

func (i *Indexer) Index(path string) ([]Entry, error) {
	isRoot := i.isRoot(path)
	dir, err := i.guard(filepath.Join(i.root, path))
	if err != nil {
		return nil, fmt.Errorf("failed to guard off subdir, %w", err)
	}

	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, fmt.Errorf("failed to read directory, %w", err)
	}

	var es []Entry
	if !isRoot {
		es = make([]Entry, 0, len(entries)+1)
		es = i.addTraversalEntries(es, dir)
	} else {
		es = make([]Entry, 0, len(entries))
	}

	for _, entry := range entries {
		name := entry.Name()
		u := url.PathEscape(name)

		fp, _ := i.toRelative(filepath.Join(dir, name))

		e := Entry{
			Name: name,

			Path: fp,

			EscapedURI:  u,
			EscapedHTML: html.EscapeString(name),

			IsDirectory: entry.Type().IsDir(),
			IsFile:      entry.Type().IsRegular(),
		}

		if e.IsFile {
			info, err := entry.Info()
			if err != nil {
				e.Size = "?"
			} else {
				if i.ExactSize {
					e.Size = fmt.Sprintf("%d", info.Size())
				} else {
					e.Size = humanize.Bytes(uint64(info.Size()))
				}
			}
		}
		es = append(es, e)
	}

	return es, nil
}

func (i *Indexer) addTraversalEntries(entries []Entry, path string) []Entry {
	parentDir := Entry{
		Name:        "..",
		EscapedURI:  "..",
		EscapedHTML: "..",
		IsDirectory: true,
		IsFile:      false,
		Size:        "",
	}
	parentDirPath, _ := i.toRelative(filepath.Join(path, ".."))
	if parentDirPath == "" {
		parentDirPath = "/"
	}
	parentDir.Path = parentDirPath

	return append(entries, parentDir)
}

func (i *Indexer) isRoot(path string) bool {
	r, _ := filepath.Rel(i.root, filepath.Join(i.root, path))
	return r == "."
}

func (i *Indexer) toRelative(path string) (string, error) {
	g, err := i.guard(path)
	if err != nil {
		return "", err
	}
	r := strings.TrimPrefix(g, i.root)
	return r, nil
}

func (i *Indexer) guard(path string) (string, error) {
	a, err := filepath.Abs(i.root)
	if err != nil {
		return "", err
	}

	b, err := filepath.Abs(path)
	if err != nil {
		return "", err
	}

	if strings.HasPrefix(b, a) {
		return path, nil
	}

	return i.root, nil
}
