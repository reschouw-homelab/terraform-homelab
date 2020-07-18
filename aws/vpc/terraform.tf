terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/vpc.tfstate"
    region = "us-west-2"
  }
}
