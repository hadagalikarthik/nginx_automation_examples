# backend.tf for GCS
terraform {
  backend "gcs" {
    # bucket         = var.GCP_BUCKET_NAME
    prefix         = "terraform/infra/terraform.tfstate"
    project        = var.TF_VAR_GCP_PROJECT_ID
  }
}
