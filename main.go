package main

import (
	"log"
	"net/http"
)

func main() {
	// 1. Create a file server handler that points to the current directory "."
	// This will automatically look for "index.html" when you hit the root URL.
	fs := http.FileServer(http.Dir("."))

	// 2. Map the root URL "/" to the file server
	http.Handle("/", fs)

	log.Println("Server starting on :8080...")
	
	// 3. Start the server
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal(err)
	}
}
