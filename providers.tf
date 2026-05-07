# This tells Terraform: "go get the AWS plugin"
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # download from HashiCorp's registry
      version = "~> 5.0"         # use version 5.x
    }
  }
}

# This tells Terraform WHERE in AWS to build things
provider "aws" {
  region = var.aws_region  # we'll define this in variables.tf 
  profile = "terraform" 
}