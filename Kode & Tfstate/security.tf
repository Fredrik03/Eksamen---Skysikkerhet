resource "google_compute_security_policy" "web_security_policy" {
  name        = "web-security-policy"
  description = "Security policy protecting against SQL injection, XSS, RCE, LFI, and brute-force attacks"

  # Block SQL injection attempts
  rule {
    priority    = 1000
    action      = "deny(403)"
    description = "Block SQL injection attempts"

    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sqli-stable')"
      }
    }
  }

  # Block XSS attacks
  rule {
    priority    = 2000
    action      = "deny(403)"
    description = "Block XSS attacks"

    match {
      expr {
        expression = "evaluatePreconfiguredWaf('xss-stable')"
      }
    }
  }

  # Block Local File Inclusion (LFI) attacks
  rule {
    priority    = 2500
    action      = "deny(403)"
    description = "Block Local File Inclusion (LFI) attacks"

    match {
      expr {
        expression = "evaluatePreconfiguredWaf('lfi-stable')"
      }
    }
  }

  # Block Remote Code Execution (RCE) attacks
  rule {
    priority    = 2600
    action      = "deny(403)"
    description = "Block Remote Code Execution (RCE) attacks"

    match {
      expr {
        expression = "evaluatePreconfiguredWaf('rce-stable')"
      }
    }
  }
  # Throttle rule: if an IP exceeds 10 requests per minute, block with a 403
  rule {
    priority    = 3000
    action      = "throttle"
    description = "Throttle requests exceeding 10 per minute per IP"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    rate_limit_options {
      conform_action = "allow"
      exceed_action  = "deny(403)"

      enforce_on_key = ""
      enforce_on_key_configs {
        enforce_on_key_type = "IP"
      }
      rate_limit_threshold {
        count        = 10
        interval_sec = 60
      }
    }
  }

  # Default allow rule
  rule {
    priority    = 2147483647
    action      = "allow"
    description = "Default rule"

    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
  }
}