resource "google_compute_backend_service" "http_backend" {
  name        = "http-backend-service"
  description = "Backend service for HTTP traffic"
  protocol    = "HTTP"
  port_name   = "http" 
  timeout_sec = 30
  security_policy = google_compute_security_policy.sql_xss_protection.id

  backend {
    group = google_compute_instance_group_manager.igm.instance_group
  }

  health_checks = [google_compute_http_health_check.health_check.self_link]
}

resource "google_compute_http_health_check" "health_check" {
  name               = "http-health-check"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2
  request_path       = "/"
}
