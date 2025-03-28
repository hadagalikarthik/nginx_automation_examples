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

variable "AWS_REGION" {
  description = "aws region"
  type        = string
}

variable "AWS_S3_BUCKET_NAME" {
  description = "aws s3 bucket name"
  type        = string
}