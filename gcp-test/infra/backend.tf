# backend.tf for GCS
terraform {
  backend "gcs" {
    bucket         = var.GCP_BUCKET_NAME
    prefix         = "terraform/infra/terraform.tfstate"
    # credentials    = "path/to/your-service-account-key.json"
  }
}
