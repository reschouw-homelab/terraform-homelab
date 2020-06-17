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

data "vsphere_datastore" "esxi-4-local" {
  name = "esxi-4-local"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-18-04-20200617005527"
  #name          = "terraform-test-template"
  datacenter_id = data.vsphere_datacenter.dc.id
}
