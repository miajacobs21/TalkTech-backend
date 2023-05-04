terraform {
  backend "s3" {
<<<<<<< HEAD
    bucket = "talktech-app-terraform-state" # Your unique AWS S3 bucket
    # create a sub-folder called develop
    key     = "develop/talktechapp.tfstate"
=======
    bucket  = "talktech-app-terraform-state" # Your unique AWS S3 bucket
    # create a sub-folder called production
    key     = "production/talktechapp.tfstate"
>>>>>>> origin/develop
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
