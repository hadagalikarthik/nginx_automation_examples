data "terraform_remote_state" "infra" {
  backend = "gcs"
  config = {
    bucket = var.GCP_BUCKET_NAME       # Your S3 bucket name
    key    = "infra/terraform.tfstate"       # Path to infra's state file
    region = var.GCP_REGION                    # AWS region
  }
}

# Read eks state from S3
data "terraform_remote_state" "gke" {
  backend = "gcs"
  config = {
    bucket =  var.GCP_BUCKET_NAME        # Your S3 bucket name
    key    = "gke/terraform.tfstate" # Path to EKS state file
    region = var.GCP_REGION                   # AWS region
  }
}

# data "tfe_outputs" "infra" {
#   organization    = var.tf_cloud_organization
#   workspace       = "infra"
# }
#
# data "tfe_outputs" "gke" {
#   organization    = var.tf_cloud_organization
#   workspace       = "gke"
# }

# data "aws_eks_cluster_auth" "auth" {
#   name = local.cluster_name
# }

data "kubernetes_service_v1" "nginx-service" {
  metadata {
    name      = try(format("%s-%s-controller", helm_release.nginx-plus-ingress.name, helm_release.nginx-plus-ingress.chart))
    namespace = try(helm_release.nginx-plus-ingress.namespace)
  }
}
