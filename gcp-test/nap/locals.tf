# locals {
#   project_prefix          = data.terraform_remote_state.infra.outputs.project_prefix
#   build_suffix            = data.terraform_remote_state.infra.outputs.build_suffix
#   cluster_name            = data.terraform_remote_state.gke.outputs.cluster_name  # Single definition
#   ebs_csi_driver_role_arn = data.terraform_remote_state.gke.outputs.ebs_csi_driver_role_arn
#   cluster_endpoint        = data.terraform_remote_state.gke.outputs.cluster_endpoint
#   aws_region              = data.terraform_remote_state.infra.outputs.aws_region
#   host                    = data.terraform_remote_state.eks.outputs.cluster_endpoint
#   cluster_ca_certificate  = data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data
#   app                     = format("%s-nap-%s", local.project_prefix, local.build_suffix)
# }

locals {
  project_prefix         = data.terraform_remote_state.infra.outputs.project_prefix
  build_suffix            = data.terraform_remote_state.infra.outputs.build_suffix
  host                   = data.terraform_remote_state.gke.outputs.kubernetes_api_server_url
  region                 = data.terraform_remote_state.infra.outputs.gcp_region
  cluster_ca_certificate = data.terraform_remote_state.gke.outputs.kubernetes_cluster_ca_certificate
  cluster_name           = data.terraform_remote_state.gke.outputs.kubernetes_cluster_name
  cluster_token          = data.terraform_remote_state.gke.outputs.kubernetes_cluster_access_token
  cidr                   = data.terraform_remote_state.infra.outputs.cidr
  lb_ip                  = cidrhost(local.cidr, 50)
}