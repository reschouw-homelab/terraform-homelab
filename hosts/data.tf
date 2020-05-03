data "vsphere_datacenter" "dc" {
  name = "Dorwinia"
}

data "vsphere_host" "esxi-1" {
  name = "esxi-1.dorwinia.com"
  datacenter_id = data.vsphere_datacenter.dc.id
}

output "esxi-1-id" {
  value = data.vsphere_host.esxi-1
}
