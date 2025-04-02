# NGINX Configuration
variable "nginx_registry" {
  type        = string
  description = "NGINX Docker registry"
  default     = "private-registry.nginx.com"
}

variable "nginx_pwd" {
  type        = string
  description = "Password for NGINX (if required)"
  default     = "none"
}

variable "workspace_path" {
  description = "The path to the workspace directory"
  type        = string
}

variable "nginx_jwt" {
  description = "The JWT token for NGINX"
  type        = string
  sensitive   = true  # Mark as sensitive to avoid exposing it in logs
}

variable "tf_cloud_organization" {
  type        = string
  description = "TF cloud org (Value set in TF cloud)"
}

variable "ssh_key" {
  type        = string
  description = "Only present for warning handling with TF cloud variable set"
}