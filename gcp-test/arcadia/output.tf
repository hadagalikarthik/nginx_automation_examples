output "external_name" {
  description = "The external hostname of NGINX Ingress from NAP"
  value       = data.tfe_outputs.gke.values.kubernetes_api_server_url
  sensitive = true
}
