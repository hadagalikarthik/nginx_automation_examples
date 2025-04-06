# data "tfe_outputs" "infra" {
#   organization = var.tf_cloud_organization
#   workspace = "infra"
# }

data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    prefix    = "infra/terraform.tfstate"       # Path to infra's state file
  }
}

