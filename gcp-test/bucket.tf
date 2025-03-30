resource "google_storage_bucket" "bucket" {
  name     = var.GCP_PROJECT_ID
  location = var.GCP_REGION
}