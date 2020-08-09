terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/ses.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}

terraform {
  required_version = ">= 0.12"
}
