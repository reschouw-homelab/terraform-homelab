terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "dorwinia-tf-state/hosts.tfstate"
    region = "us-west-2"
  }
}
