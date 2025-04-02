# backend.tf for GCS
terraform {
  cloud {
    organization = "${{ secrets.TF_CLOUD_ORGANIZATION }}"
    workspaces {
      name = "${{ secrets.TF_CLOUD_WORKSPACE_INFRA }}"
    }
  }
}

terraform {
  backend "gcs" {
    # bucket         = var.GCP_BUCKET_NAME
    prefix         = "terraform/infra/terraform.tfstate"
    # credentials    = var.GOOGLE_CREDENTIALS
  }
}
