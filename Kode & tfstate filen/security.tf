resource "google_compute_security_policy" "sql_xss_protection" {
  name        = "sql-xss-protection-policy"
  description = "Protect against SQL injection and XSS attacks"

  rule {
    priority    = 1000
    action      = "deny(403)"
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sqli-stable')"
      }
    }
    description = "Block SQL injection attempts"
  }

  rule {
    priority    = 2000
    action      = "deny(403)"
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('xss-stable')"
      }
    }
    description = "Block XSS attacks"
  }

  rule {
    priority    = 2147483647
    action      = "allow"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Default rule to allow traffic"
  }
}
