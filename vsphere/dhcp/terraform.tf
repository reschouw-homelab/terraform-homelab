terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/dhcp.tfstate"
    region = "us-west-2"
  }
}
