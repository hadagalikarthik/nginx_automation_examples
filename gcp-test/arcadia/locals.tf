# locals {
#   project_prefix          = data.terraform_remote_state.infra.outputs.project_prefix
#   aws_region             = data.terraform_remote_state.infra.outputs.aws_region
#   external_name          = try(data.terraform_remote_state.nap.outputs.external_name)
#   host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#   cluster_ca_certificate = data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data
#   cluster_name           = data.terraform_remote_state.eks.outputs.cluster_name
# }

locals {
  project_prefix         = data.tfe_outputs.infra.values.project_prefix
  build_suffix            = data.tfe_outputs.infra.values.build_suffix
  external_name          = try(data.tfe_outputs.nap.values.external_name)
  host                   = data.tfe_outputs.gke.values.kubernetes_api_server_url
  region                 = data.tfe_outputs.infra.values.gcp_region
  cluster_ca_certificate = data.tfe_outputs.gke.values.kubernetes_cluster_ca_certificate
  cluster_name           = data.tfe_outputs.gke.values.kubernetes_cluster_name
  cluster_token          = data.tfe_outputs.gke.values.kubernetes_cluster_access_token
  cidr                   = data.tfe_outputs.infra.values.cidr
  lb_ip                  = cidrhost(local.cidr, 50)
  app                     = format("%s-nap-%s", local.project_prefix, local.build_suffix)
}