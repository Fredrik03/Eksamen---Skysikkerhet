resource "google_compute_url_map" "https_url_map" {
  name            = "global-url-map"
  default_service = google_compute_backend_service.http_backend.id
}

resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "global-https-proxy"
  url_map          = google_compute_url_map.https_url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.default.self_link]
}

resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name       = "https-forwarding-rule"
  target     = google_compute_target_https_proxy.https_proxy.id
  port_range = "443"
}
