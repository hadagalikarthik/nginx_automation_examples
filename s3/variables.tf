variable "tf_state_bucket" {
  type        = string
  description = "S3 bucket for Terraform state"
  default     = "hk-nic-nap-tf-s3b"
}
variable "create_iam_resources" {
  description = "Whether to create IAM resources (role and policy)."
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "ap-south-1"
}
