locals {
  project_id      = data.tfe_outputs.infra.values.gcp_project_id
  region          = data.tfe_outputs.infra.values.gcp_region
  network_name    = data.tfe_outputs.infra.values.vpc_name
  subnet_name     = data.tfe_outputs.infra.values.vpc_subnet
  project_prefix  = data.tfe_outputs.infra.values.project_prefix
}
