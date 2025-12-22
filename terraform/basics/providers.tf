terraform {
    required_version = "1.5.7"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.27.0"
        }
  }
  # backend s3 {
  #   bucket = "codepanda-terraform-statebucket-2025"
  #   key = "codepanda_iac/codepanda_iac_demo.tfstate"
  #   region = "us-east-1"
  #   profile = "default"
  # }
  
}

provider "aws" {
    region = "us-east-1"
    profile = "codepanda"
}