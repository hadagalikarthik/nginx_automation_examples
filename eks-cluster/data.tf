data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket =  "hk-nic-nap-tf-s3b"       # Your S3 bucket name
    key    = "infra/terraform.tfstate"       # Path to infra's state file
    region = "ap-south-1"                     # AWS region
  }
}

