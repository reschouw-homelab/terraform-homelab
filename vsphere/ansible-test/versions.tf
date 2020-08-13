terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
  required_version = ">= 0.13"
}
