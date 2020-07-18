terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/aws/eks.tfstate"
    region = "us-west-2"
  }
}
