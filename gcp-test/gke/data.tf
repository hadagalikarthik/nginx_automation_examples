# data "tfe_outputs" "infra" {
#   organization = var.tf_cloud_organization
#   workspace = "infra"
# }

data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    bucket =  var.GCP_BUCKET_NAME       # Your S3 bucket name
    key    = "infra/terraform.tfstate"       # Path to infra's state file
    region = var.GCP_REGION                    # AWS region
  }
}

