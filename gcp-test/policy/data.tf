# Read infra state from gcs
data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    prefix    = "infra/terraform.tfstate"           # Path to infra state file
  }
}

# Read gke state from gcs
data "terraform_remote_state" "gke" {
  backend = "gcs"
  config = {
    prefix    = "gke/terraform.tfstate"              # Path to GKE state file
  }
}

# Read nap state from gcs
data "terraform_remote_state" "nap" {
  backend = "gcs"
  config = {
    prefix    = "nap/terraform.tfstate"              # Path to NAP state file
  }
}
# 
# data "tfe_outputs" "infra" {
#   organization    = var.tf_cloud_organization
#   workspace       = "infra"
# }
# 
# data "tfe_outputs" "gke" {
#   organization    = var.tf_cloud_organization
#   workspace       = "gke"
# }
# 
# data "tfe_outputs" "nap" {
#   organization    = var.tf_cloud_organization
#   workspace       = "nap"
# }

# Keep existing data sources for Kubernetes
# data "aws_eks_cluster_auth" "auth" {
#   name = data.terraform_remote_state.eks.outputs.cluster_name
# }

