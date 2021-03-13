provider "google" {
  credentials = file("account.json")
  project     = "omar-gke-example"
  region      = "europe-west2"
  version     = "~> 2.5.0"
}
