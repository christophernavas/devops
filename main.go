package main

import (
	"log"
	"net/http"
	"wsf/devops/handler"
)

func main() {

	myHandler := handler.NewHandler()

	server := &http.Server{
		Addr:    ":8080",
		Handler: myHandler,
	}

	log.Fatal(server.ListenAndServe())
}
