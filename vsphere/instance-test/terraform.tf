terraform {
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "path/to/my/tf-state"
    region = "us-west-2"
  }
}
