resource "google_compute_resource_policy" "backup_policy_europe" {
  name   = "daily-backup-policy-eu"
  region = "europe-west1"

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
resource "google_compute_resource_policy" "backup_policy_north_america" {
  name   = "daily-backup-policy-na"
  region = "us-central1"

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
resource "google_compute_resource_policy" "backup_policy_asia" {
  name   = "daily-backup-policy-asia"
  region = "asia-east1"

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
resource "google_compute_resource_policy" "backup_policy_australia" {
  name   = "daily-backup-policy-au"
  region = "australia-southeast1"

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


