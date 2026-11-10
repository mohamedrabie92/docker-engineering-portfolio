package main
import (
 "encoding/json"
 "net/http"
)
func main() {
 http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
  if r.URL.Path != "/" && r.URL.Path != "/health" { http.NotFound(w,r); return }
  w.Header().Set("Content-Type", "application/json")
  json.NewEncoder(w).Encode(map[string]string{"service":"go", "status":"ok"})
 })
 http.ListenAndServe(":8080", nil)
}
