resource "google_compute_instance_group_manager" "igm_europe" {
  name               = "igm-europe"
  base_instance_name = "vm-europe"
  zone               = "europe-west1-b"

  version {
    instance_template = google_compute_instance_template.vm_template_europe.id
  }

  target_size = 1

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_instance_group_manager" "igm_north_america" {
  name               = "igm-north-america"
  base_instance_name = "vm-north-america"
  zone               = "us-central1-a"

  version {
    instance_template = google_compute_instance_template.vm_template_north_america.id
  }

  target_size = 1

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_instance_group_manager" "igm_asia" {
  name               = "igm-asia"
  base_instance_name = "vm-asia"
  zone               = "asia-east1-a"

  version {
    instance_template = google_compute_instance_template.vm_template_asia.id
  }

  target_size = 1

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_instance_group_manager" "igm_australia" {
  name               = "igm-australia"
  base_instance_name = "vm-australia"
  zone               = "australia-southeast1-a"

  version {
    instance_template = google_compute_instance_template.vm_template_australia.id
  }

  target_size = 1

  named_port {
    name = "http"
    port = 80
  }
}
