data "vsphere_datacenter" "dc" {
  name = "Dorwinia"
}

data "vsphere_resource_pool" "default-pool" {
  name          = "Dorwinia/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vm-net" {
  name = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "esxi-1-local" {
  name = "esxi-1-local"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-18-04-20200705223153"
  datacenter_id = data.vsphere_datacenter.dc.id
}
