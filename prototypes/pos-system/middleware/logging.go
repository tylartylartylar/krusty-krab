package middleware

import (
    "crypto/rand"
    "encoding/hex"
    "fmt"
    "log"
    "net/http"
    "time"
)

type customResponseWriter struct {
    http.ResponseWriter
    statusCode int
}

func (crw *customResponseWriter) WriteHeader(statusCode int) {
    crw.statusCode = statusCode
    crw.ResponseWriter.WriteHeader(statusCode)
}

func generateRequestID(length int) (string, error) {
    randomBytes := make([]byte, length)
    _, err := rand.Read(randomBytes)
    if err != nil {
        return "", err
    }
    return hex.EncodeToString(randomBytes), nil
}

func Logging(h http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        startTime := time.Now()

        requestID, err := generateRequestID(8)
        if err != nil {
            requestID = fmt.Sprintf("error-%d", time.Now().UnixNano())
        }

        log.Printf("Request started: ID=%s Method=%s Path=%s RemoteAddr=%s UserAgent=%s",
            requestID,
            r.Method,
            r.URL.Path,
            r.RemoteAddr,
            r.UserAgent())
        
        customWriter := &customResponseWriter{
            ResponseWriter: w,
            statusCode:     http.StatusOK,
        }

        h.ServeHTTP(customWriter, r)
        
        duration := time.Since(startTime)
        
        log.Printf("Request completed: ID=%s Method=%s Path=%s Status=%d Duration=%v RemoteAddr=%s",
            requestID,
            r.Method,
            r.URL.Path,
            customWriter.statusCode,
            duration,
            r.RemoteAddr)
    })
}