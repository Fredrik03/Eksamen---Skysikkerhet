resource "google_bigquery_dataset" "log_dataset" {
  dataset_id = "logs_dataset"
  project    = "konte-eksamen-eksempel1"
  location   = "EU"

  labels = {
    environment = "production"
  }
}
resource "google_logging_project_sink" "log_sink" {
  name                   = "bigquery-logging-sink"
  destination            = "bigquery.googleapis.com/projects/konte-eksamen-eksempel1/datasets/logs_dataset"
  filter                 = "logName:*"
  unique_writer_identity = true
}

resource "google_project_iam_member" "bq_sink_role" {
  project = "konte-eksamen-eksempel1"
  role    = "roles/bigquery.dataEditor"
  member  = google_logging_project_sink.log_sink.writer_identity
}