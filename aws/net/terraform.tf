terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/tunnel-box.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}