resource "google_compute_resource_policy" "backup_policy" {
  name   = "daily-backup-policy"
  region = "europe-north1"

  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "03:00"
      }
    }

    retention_policy {
      max_retention_days    = 7
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }

    snapshot_properties {
      labels = {
        environment = "production"
        service     = "http-backend"
      }
    }
  }
}

resource "google_compute_instance_template" "vm_template" {
  name         = "strelizia-template"
  machine_type = "e2-micro"

  tags = ["http", "strelizia", "lb", "l7fw"]

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    resource_policies = [
      google_compute_resource_policy.backup_policy.id
    ]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      systemctl enable nginx
      systemctl start nginx
    EOT
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vpc_http_servers_subnet.id
    access_config {}
  }
}

resource "google_compute_instance_group_manager" "igm" {
  name = "igm-strelizia"
  zone = "europe-north1-a"
  version {
    instance_template = google_compute_instance_template.vm_template.id
  }
  base_instance_name = "strelizia"
  target_size        = 1

  named_port {
    name = "http"
    port = 80
  }
}
