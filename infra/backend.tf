terraform {
  backend "s3" {
    bucket         = ""       # Your S3 bucket name
    key            = "infra/terraform.tfstate"       # Path to state file
    region         = ""                    # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
    encrypt        = true                        
  }
}
