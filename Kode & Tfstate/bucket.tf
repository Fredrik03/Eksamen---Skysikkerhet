terraform {
  backend "gcs" {
    bucket = "sky-konte-eksamen"
    prefix = "terraform/state"
  }
}