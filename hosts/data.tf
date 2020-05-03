data "vsphere_datacenter" "dc" {
  name = "Dorwinia"
}

data "vsphere_host" "esxi-1" {
  name = "esxi-1.dorwinia.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "esxi-4" {
  name = "esxi-4.dorwinia.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Data call below used to grab host ID for imports
#output "esxi-4-id" {
#  value = data.vsphere_host.esxi-4
#}
