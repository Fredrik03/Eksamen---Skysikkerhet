resource "google_compute_url_map" "http_url_map" {
  name            = "http-url-map"
  default_service = google_compute_backend_service.http_backend.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.http_url_map.id
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"
}
