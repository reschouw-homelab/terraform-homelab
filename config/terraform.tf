terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/config.tfstate"
    region = "us-west-2"
  }
}
