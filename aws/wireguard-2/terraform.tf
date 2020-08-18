terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/wireguard-2.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}
