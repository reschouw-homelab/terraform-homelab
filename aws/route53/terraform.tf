terraform {
  required_version = "~> 1.2.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/route53.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region  = "us-west-2"
  default_tags {
    tags = {
      terraform = true
    }
  }
}
