terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/route53.tfstate"
    region = "us-west-2"
  }
}
