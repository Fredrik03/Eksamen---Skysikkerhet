resource "google_compute_autoscaler" "autoscaler_europe" {
  name   = "autoscaler-europe"
  zone   = "europe-west1-b"
  target = google_compute_instance_group_manager.igm_europe.id

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}

resource "google_compute_autoscaler" "autoscaler_north_america" {
  name   = "autoscaler-north-america"
  zone   = "us-central1-a"
  target = google_compute_instance_group_manager.igm_north_america.id

  autoscaling_policy {
    max_replicas = 5
    min_replicas = 1
    cpu_utilization {
      target = 0.6
    }
  }
}
