terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/gitlab.tfstate"
    region = "us-west-2"
  }
}
