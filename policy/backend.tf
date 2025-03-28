terraform {
  backend "s3" {
    # bucket         = ""         # Replace with your actual bucket name
    key            = "policy/terraform.tfstate"       # Path to state file
    # region         = ""                    # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
    encrypt        = true                            # Encrypt state file at rest
  }
}
