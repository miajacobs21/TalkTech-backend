terraform {
  backend "s3" {

    bucket = "talktech-app-terraform-state" # Your unique AWS S3 bucket
    # create a sub-folder called develop
    key     = "develop/talktechapp.tfstate"
    region  = "us-east-1" # Your AWS region
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"

  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Mia Jacobs" # Your fullname
  }
}
