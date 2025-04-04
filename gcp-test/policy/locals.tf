# locals {
#   project_prefix          = data.tfe_outputs.infra.values.project_prefix
#   build_suffix            = data.tfe_outputs.infra.values.build_suffix
#   aws_region              = data.tfe_outputs.infra.values.gcp_region
#   host                    = data.tfe_outputs.gke.values.cluster_endpoint
#   cluster_ca_certificate  = data.tfe_outputs.gke.values.kubeconfig-certificate-authority-data
#   cluster_name            = data.tfe_outputs.gke.values.cluster_name
#   app                     = format("%s-nap-%s", local.project_prefix, local.build_suffix)
# }

locals {
  project_prefix         = data.tfe_outputs.infra.values.project_prefix
  build_suffix            = data.tfe_outputs.infra.values.build_suffix
  host                   = data.tfe_outputs.gke.values.kubernetes_api_server_url
  region                 = data.tfe_outputs.infra.values.gcp_region
  cluster_ca_certificate = data.tfe_outputs.gke.values.kubernetes_cluster_ca_certificate
  cluster_name           = data.tfe_outputs.gke.values.kubernetes_cluster_name
  cluster_token          = data.tfe_outputs.gke.values.kubernetes_cluster_access_token
  cidr                   = data.tfe_outputs.infra.values.cidr
  lb_ip                  = cidrhost(local.cidr, 50)
  app                     = format("%s-nap-%s", local.project_prefix, local.build_suffix)
}