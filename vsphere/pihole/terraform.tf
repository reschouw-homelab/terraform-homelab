terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/pihole.tfstate"
    region = "us-west-2"
  }
}
