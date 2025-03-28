terraform {
  backend "s3" {
    bucket         = var.AWS_S3_BUCKET_NAME         # Replace with your actual bucket name
    key            = "policy/terraform.tfstate"       # Path to state file
    region         = var.AWS_REGION                    # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
    encrypt        = true                            # Encrypt state file at rest
  }
}
