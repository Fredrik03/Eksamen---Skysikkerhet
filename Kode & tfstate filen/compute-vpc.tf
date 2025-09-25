resource "google_compute_network" "vpc_http_servers" {
  name                    = "vpc-http-servers"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_http_servers_subnet" {
  name                  = "vpc-http-servers-subnet"
  ip_cidr_range         = "10.10.0.0/24"
  network               = google_compute_network.vpc_http_servers.name
  region                = "europe-north1"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
