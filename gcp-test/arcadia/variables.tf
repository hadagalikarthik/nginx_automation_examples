# variable "AWS_REGION" {
#   description = "aws region"
#   type        = string
#   default     = ""
# }
#
# variable "AWS_S3_BUCKET_NAME" {
#   description = "aws s3 bucket name"
#   type        = string
#   default     = ""
# }

# variable "tf_cloud_organization" {
#   type        = string
#   description = "TF cloud org (Value set in TF cloud)"
# }

variable "GCP_REGION" {
  description = "GCP region name"
  type        = string
}

variable "GCP_BUCKET_NAME" {
  description = "GCP bucket name"
  type    = string
}