resource "google_compute_instance_template" "vm_template_europe" {
  name         = "vm-template-europe"
  machine_type = "e2-micro"

  tags = ["http", "lb"]

  disk {
    source_image      = "debian-cloud/debian-12"
    auto_delete       = true
    resource_policies = [google_compute_resource_policy.backup_policy_europe.id]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      cat <<EOF > /var/www/html/index.nginx-debian.html
      <html>
      <head><title> Nova Tech Solutions</title> </head>
      <body>
        <h1>Welcome to NovaTech Solutions</h1>
        <h2>You are connected to the <strong>European</strong> server</h2>
        </body>
      </html>
      EOF
      systemctl enable nginx
      systemctl start nginx
    EOT
  }

  network_interface {
    network    = google_compute_network.vpc_https_servers.self_link
    subnetwork = google_compute_subnetwork.subnet_europe.self_link
    access_config {}
  }
}

resource "google_compute_instance_template" "vm_template_north_america" {
  name         = "vm-template-north-america"
  machine_type = "e2-micro"

  tags = ["http", "lb"]

  disk {
    source_image      = "debian-cloud/debian-12"
    auto_delete       = true
    resource_policies = [google_compute_resource_policy.backup_policy_north_america.id]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      cat <<EOF > /var/www/html/index.nginx-debian.html
      <html>
      <head><title> Nova Tech Solutions</title> </head>
      <body>
        <h1>Welcome to NovaTech Solutions</h1>
        <h2>You are connected to the <strong>North-American</strong> server</h2>
        </body>
      </html>
      EOF
      systemctl enable nginx
      systemctl start nginx
    EOT
  }

  network_interface {
    network    = google_compute_network.vpc_https_servers.self_link
    subnetwork = google_compute_subnetwork.subnet_north_america.self_link
    access_config {}
  }
}

resource "google_compute_instance_template" "vm_template_asia" {
  name         = "vm-template-asia"
  machine_type = "e2-micro"

  tags = ["http", "lb"]

  disk {
    source_image      = "debian-cloud/debian-12"
    auto_delete       = true
    resource_policies = [google_compute_resource_policy.backup_policy_asia.id]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      cat <<EOF > /var/www/html/index.nginx-debian.html
      <html>
      <head><title> Nova Tech Solutions</title> </head>
      <body>
        <h1>Welcome to NovaTech Solutions</h1>
        <h2>You are connected to the <strong>Asian</strong> server</h2>
        </body>
      </html>
      EOF
      systemctl enable nginx
      systemctl start nginx
    EOT
  }

  network_interface {
    network    = google_compute_network.vpc_https_servers.self_link
    subnetwork = google_compute_subnetwork.subnet_asia.self_link
    access_config {}
  }
}

resource "google_compute_instance_template" "vm_template_australia" {
  name         = "vm-template-australia"
  machine_type = "e2-micro"

  tags = ["http", "lb"]

  disk {
    source_image      = "debian-cloud/debian-12"
    auto_delete       = true
    resource_policies = [google_compute_resource_policy.backup_policy_australia.id]
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      cat <<EOF > /var/www/html/index.nginx-debian.html
      <html>
      <head><title> Nova Tech Solutions</title> </head>
      <body>
        <h1>Welcome to NovaTech Solutions</h1>
        <h2>You are connected to the <strong>Australian</strong> server</h2>
        </body>
      </html>
      EOF
      systemctl enable nginx
      systemctl start nginx
    EOT
  }

  network_interface {
    network    = google_compute_network.vpc_https_servers.self_link
    subnetwork = google_compute_subnetwork.subnet_australia.self_link
    access_config {}
  }
}
