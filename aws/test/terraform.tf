terraform {
  required_version = "~> 0.15"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/module-test.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region  = "us-west-2"
}
