package main

import (
	"log"
	"net/http"

	"krusty-krab/prototypes/pos-system/api/root"
	"krusty-krab/prototypes/pos-system/api/v1"
	"krusty-krab/prototypes/pos-system/middleware"
)

func main() {
	mux := http.NewServeMux()

	v1.RegisterRoutes(mux)

	mux.HandleFunc("/", root.Handler())

	server := &http.Server{
		Addr:    ":8080",
		Handler: middleware.Logging(mux),
	}

	log.Println("Starting Server on :8080")
	server.ListenAndServe()
}