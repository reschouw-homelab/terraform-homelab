provider "vsphere" {
  user           = "***REMOVED***"
  password       = "***REMOVED***"
  vsphere_server = "vcenter.dorwinia.com"
  version = "~> 1.18.0"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}
