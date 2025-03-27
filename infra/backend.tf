terraform {
  backend "s3" {
    bucket         = "hk-nic-nap-tf-s3b"       # Your S3 bucket name
    key            = "infra/terraform.tfstate"       # Path to state file
    region         = "ap-south-1"                     # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
    encrypt        = true                        
  }
}
