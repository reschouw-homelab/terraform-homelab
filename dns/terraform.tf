terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/dns.tfstate"
    region = "us-west-2"
  }
}
