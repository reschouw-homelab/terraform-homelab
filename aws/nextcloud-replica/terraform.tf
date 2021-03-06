terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.14.0"
    }
  }
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/nextcloud-replica.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region  = "us-east-2"
  default_tags {
    tags = {
      terraform = true
    }
  }
}
