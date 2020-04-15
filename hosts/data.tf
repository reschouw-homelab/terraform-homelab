data "vsphere_datacenter" "dc" {
  name = "Dorwinia"
}

#data "vsphere_resource_pool" "default-pool" {
#  name          = "esxi1.dorwinia.com/Resource"
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

data "vsphere_host" "esxi-1" {
  name = "esxi-1.dorwinia.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}

output "esxi-1-id" {
  value = data.vsphere_host.esxi-1
}
