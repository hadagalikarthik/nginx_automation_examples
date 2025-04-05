provider "google" {
    region                  = local.region
}

# provider "kubernetes" {
#   host                   = data.tfe_outputs.gke.values.kubernetes_cluster_host
#   cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#   token                  = local.cluster_token
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     args = [
#       "eks",
#       "get-token",
#       "--cluster-name",
#       local.cluster_name
#     ]
#   }
# }

provider "kubernetes" {
  host                   = data.tfe_outputs.gke.values.kubernetes_api_server_url
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
  token                  = local.cluster_token

  # Optional: Using exec for kubectl authentication
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gcloud"
    args = [
      "container", "clusters", "get-credentials",
      local.cluster_name,  # Assuming 'local.cluster_name' is set
      "--region", local.region  # Assuming 'local.cluster_region' is set
    ]
  }
}

# provider "helm" {
#   kubernetes {
#     host                   = data.tfe_outputs.gke.values.kubernetes_cluster_host
#     cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#     token                  = local.cluster_token
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       command     = "aws"
#       args = [
#         "eks",
#         "get-token",
#         "--cluster-name",
#         local.cluster_name
#       ]
#     }
#   }
# }

provider "helm" {
  kubernetes {
    host                   = data.tfe_outputs.gke.values.kubernetes_api_server_url
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
    token                  = local.cluster_token

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "gcloud"
      args = [
        "container", "clusters", "get-credentials",
        local.cluster_name,  # Cluster name
        "--region", local.region  # Cluster region
      ]
    }
  }
}

# provider "kubectl" {
#   host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#   cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data)
#   token                  = data.aws_eks_cluster_auth.auth.token
#   load_config_file       = false
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     args = [
#       "eks",
#       "get-token",
#       "--cluster-name",
#       data.terraform_remote_state.eks.outputs.cluster_name
#     ]
#   }
# }

provider "kubectl" {
    host                    = data.tfe_outputs.gke.values.kubernetes_api_server_url
    cluster_ca_certificate  = base64decode(local.cluster_ca_certificate)
    token                   = local.cluster_token
    load_config_file        = false
    exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gcloud"
    args = [
      "container", "clusters", "get-credentials",
      local.cluster_name,  # Cluster name
      "--region", local.region  # Cluster region
    ]
  }
}