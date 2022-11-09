package main

import (
	"fmt"
	"log"
	"net/http"
)

func test() {
	fmt.Println("Go start")
	fmt.Println("Listen Serve 8080")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World")
	})

	log.Fatal(http.ListenAndServe(":8081", nil))

}