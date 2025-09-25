resource "google_compute_managed_ssl_certificate" "default" {
  name = "managed-ssl-cert"

  managed {
    domains = [
      "wrathbyte.com",
      "www.wrathbyte.com"
    ]
  }
}
