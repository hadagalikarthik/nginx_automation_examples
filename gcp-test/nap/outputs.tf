output "external_name" {
    value = data.tfe_outputs.gke.values.kubernetes_api_server_url
}
output "external_port" {
    value = try(data.kubernetes_service_v1.nginx-service.spec.0.port.0.port, null)
}
output "origin_source" {
    value = "nap"
}

output "nap_deployment_name" {
    value = try (helm_release.nginx-plus-ingress.name)
    sensitive = true
}

