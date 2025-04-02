# backend.tf for GCS
terraform {
  backend "gcs" {
    # bucket         = var.GCP_BUCKET_NAME
    prefix         = "terraform/infra/terraform.tfstate"
    project     = var.GCP_PROJECT_ID
    # credentials    = var.GOOGLE_CREDENTIALS
  }
}
