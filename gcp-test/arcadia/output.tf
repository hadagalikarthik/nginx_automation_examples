output "external_name" {
  description = "The external hostname of NGINX Ingress from NAP"
  # value       = data.tfe_outputs.gke.values.kubernetes_api_server_url
  value = data.terraform_remote_state.nap.outputs.external_name
  sensitive = true
}
