resource "google_compute_backend_service" "http_backend" {
  name            = "http-backend-service"
  description     = "Backend service for HTTP traffic"
  protocol        = "HTTP"
  port_name       = "http"
  timeout_sec     = 30
  security_policy = google_compute_security_policy.web_security_policy.id

  backend {
    group = google_compute_instance_group_manager.igm_europe.instance_group
  }

  backend {
    group = google_compute_instance_group_manager.igm_north_america.instance_group
  }

  backend {
    group = google_compute_instance_group_manager.igm_asia.instance_group
  }

  backend {
    group = google_compute_instance_group_manager.igm_australia.instance_group
  }

  health_checks = [google_compute_http_health_check.health_check.self_link]
}
