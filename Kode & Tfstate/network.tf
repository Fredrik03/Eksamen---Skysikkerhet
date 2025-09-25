resource "google_compute_network" "vpc_https_servers" {
  name                    = "vpc-https-servers"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_europe" {
  name          = "subnet-europe"
  ip_cidr_range = "10.10.0.0/24"
  network       = google_compute_network.vpc_https_servers.name
  region        = "europe-west1"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "subnet_north_america" {
  name          = "subnet-north-america"
  ip_cidr_range = "10.20.0.0/24"
  network       = google_compute_network.vpc_https_servers.name
  region        = "us-central1"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "subnet_asia" {
  name          = "subnet-asia"
  ip_cidr_range = "10.30.0.0/24"
  network       = google_compute_network.vpc_https_servers.name
  region        = "asia-east1"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "subnet_australia" {
  name          = "subnet-australia"
  ip_cidr_range = "10.40.0.0/24"
  network       = google_compute_network.vpc_https_servers.name
  region        = "australia-southeast1"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
