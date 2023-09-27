package autoindex

import (
	"os"
	"path"
	"testing"
)

func TestIndex(t *testing.T) {
	cwd, _ := os.Getwd()
	root := path.Join(cwd, "../../examples/nesting-a")

	i, _ := NewIndexer(root, Options{
		ExactSize: false,
	})

	t.Run("non-root", func(t *testing.T) {
		entries, err := i.Index("/2023/all-things-must-end/pre-renders/2023-09-22/")
		if err != nil {
			t.Error(err)
		}

		for _, entry := range entries {
			t.Log(entry)
		}
	})

	t.Run("non-root 2", func(t *testing.T) {
		entries, err := i.Index("/2023/")
		if err != nil {
			t.Error(err)
		}

		for _, entry := range entries {
			t.Log(entry)
		}
	})

	t.Run("root", func(t *testing.T) {
		entries, err := i.Index("/")
		if err != nil {
			t.Error(err)
		}

		for _, entry := range entries {
			t.Log(entry)
		}

	})

}

func TestGuard(t *testing.T) {
	cwd, _ := os.Getwd()
	root := path.Join(cwd, "../../examples/nesting-a")

	i, _ := NewIndexer(root, Options{})

	dir, _ := i.guard("../../../../../../././../../")
	t.Log(dir)
}
