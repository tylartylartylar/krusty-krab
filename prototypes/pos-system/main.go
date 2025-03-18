package main

import (
	"log"
	"net/http"
    "krusty-krab/prototypes/pos-system/handlers"
	"krusty-krab/prototypes/pos-system/middleware"
)

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Welcome to the Krusty Krab POS System"))
	})

	mux.HandleFunc("/health", handlers.HealthHandler())

	server := &http.Server{
		Addr:    ":8080",
		Handler: middleware.Logging(mux),
	}

	log.Println("Starting Server on :8080")
	server.ListenAndServe()
}