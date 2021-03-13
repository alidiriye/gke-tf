terraform {
  backend "gcs" {
    bucket      = "omar-gke-example"
    credentials = "./account.json"
  }
}
