terraform {
  required_version = "~> 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0"
    }
  }
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/vpc.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      environment = "homelab"
      terraform   = "true"
      terraform-path = "terraform-homelab/vpc"
    }
  }
}
