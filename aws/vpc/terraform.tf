terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/vpc.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}
