terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/ansible-test.tfstate"
    region = "us-west-2"
  }
}
