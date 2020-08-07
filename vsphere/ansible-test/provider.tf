provider "vsphere" {
  user           = local.vcenter-creds.username
  password       = local.vcenter-creds.password
  vsphere_server = "vcenter.dorwinia.com"
  version = "~> 1.18.3"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "aws" {
  region = "us-west-2"
  version = "~> 3.0"
}
