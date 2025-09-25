resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_https_servers.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # tfsec:ignore:google-compute-no-public-ingress Reason: Only Google Cloud Load Balancer IP ranges are allowed.
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["http"]
}
