resource "google_container_cluster" "primary" {
  name               = var.name
  location           = "us-central1-a"
  initial_node_count = 2

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      name = "${terraform.workspace}-k8s-cluster"
      env = "Prod"
    }

    tags = ["prod", "k8s"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
