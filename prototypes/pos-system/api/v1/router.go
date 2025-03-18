package v1

import (
	"net/http"

	"krusty-krab/prototypes/pos-system/api/v1/health"
)

func RegisterRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/api/v1/health", health.HealthHandler())
}