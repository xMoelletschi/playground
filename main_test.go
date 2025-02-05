package main

import (
	"bytes"
	"io"
	"os"
	"testing"
)

func TestMainOutput(t *testing.T) {
	originalStdout := os.Stdout
	r, w, _ := os.Pipe()
	os.Stdout = w

	main()

	w.Close()
	var buf bytes.Buffer
	io.Copy(&buf, r)
	os.Stdout = originalStdout

	// Check if the output is as expected
	expected := "Hello, World!\n"
	if buf.String() != expected {
		t.Errorf("Expected %q but got %q", expected, buf.String())
	}
}
