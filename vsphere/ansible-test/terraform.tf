terraform {
  required_version = ">= 0.13" 
  backend "s3" {
    bucket = "dorwinia-tf-state"
    key    = "terraform-homelab/ansible-test.tfstate"
    region = "us-west-2"
  }
}

provider "vsphere" {
  #source = "hashicorp/vsphere"
  user           = local.vcenter-creds.username
  password       = local.vcenter-creds.password
  vsphere_server = "vcenter.dorwinia.com"
  version = "~> 1.22.0"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "aws" {
  #source = "hashicorp/aws"
  region = "us-west-2"
  version = "~> 3.0"
}
