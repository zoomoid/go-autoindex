package main

import (
	"fmt"
	"io/fs"
	"testing"
)

func TestFS(t *testing.T) {
	t.Run("ReadDir", func(t *testing.T) {
		e, err := content.ReadDir("./public/fonts")
		if err != nil {
			t.Error(err)
		}
		t.Log(e)
	})
	t.Run("single file", func(t *testing.T) {
		sub, err := fs.Sub(content, "public")
		if err != nil {
			t.Error(fmt.Errorf("failed to get subtree for static files, %w", err))
		}
		_, err = sub.Open("fonts/IBMPlexSans-Bold.woff2")
		if err != nil {
			t.Error(err)
		}
	})

}

func TestMainFn(t *testing.T) {
	main()
}
