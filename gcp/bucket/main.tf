provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

resource "google_storage_bucket" "bucket" {
  name     = var.gcp_bucket_name
  location = var.gcp_region
}