data "vsphere_datacenter" "dc" {
  name = "Dorwinia"
}

data "vsphere_resource_pool" "default-pool" {
  # Only exported attribute of vsphere_datacenter is 'id'
  #name          = "${data.dc.name}/Resources"
  name          = "Dorwinia/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vm-net" {
  name = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}
