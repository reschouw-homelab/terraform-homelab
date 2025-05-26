terraform {
  required_version = ">= 0.13" 
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/route53.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
  version = "~> 3.0"
}
