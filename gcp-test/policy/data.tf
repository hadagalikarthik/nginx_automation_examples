# Read infra state from gcs
data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    bucket =  var.GCP_BUCKET_NAME                # Your gcs bucket namee
    key    = "infra/terraform.tfstate"           # Path to infra state file
    region = var.GCP_REGION                      # GCP region
  }
}

# Read gke state from gcs
data "terraform_remote_state" "gke" {
  backend = "gcs"
  config = {
    bucket =  var.GCP_BUCKET_NAME                 # Your gcs bucket name
    key    = "gke/terraform.tfstate"              # Path to GKE state file
    region = var.GCP_REGION                       # GCP region
  }
}

# Read nap state from gcs
data "terraform_remote_state" "nap" {
  backend = "gcs"
  config = {
    bucket =  var.GCP_BUCKET_NAME                 # Your gcs bucket name
    key    = "nap/terraform.tfstate"              # Path to NAP state file
    region = var.GCP_REGION                       # GCP region
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

