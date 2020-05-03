provider "vsphere" {
  user           = "***REMOVED***"
  password       = "***REMOVED***"
  vsphere_server = "vcenter.dorwinia.com"
  version = "~> 1.17.4"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}
