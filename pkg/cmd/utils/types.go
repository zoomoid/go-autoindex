package cmdutils

import (
	"io"
	"os"

	"github.com/spf13/cobra"
)

type CommandOptions interface {
	Complete(cmd *cobra.Command, args []string) error
	Validate() error

	Run() error
}

type StreamOptions struct {
	Stdout io.Writer
	Stdin  io.Reader

	Stderr io.Writer
}

func DefaultStreams() StreamOptions {
	return StreamOptions{
		Stdout: os.Stdout,
		Stdin:  os.Stdin,
		Stderr: os.Stderr,
	}
}
