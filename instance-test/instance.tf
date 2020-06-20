resource "vsphere_virtual_machine" "instance" {
  name             = "terraform-test"
  wait_for_guest_net_timeout = 0
  resource_pool_id = data.vsphere_resource_pool.default-pool.id
  datastore_id = data.vsphere_datastore.esxi-4-local.id
  num_cpus = 2
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.vm-net.id
  }
  
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  
  extra_config = {
    "guestinfo.userdata" =  base64encode(templatefile("${path.module}/cloud-init.cfg",{ssh_key = file("${path.module}/secrets/gitlab-deploy")}))
    "guestinfo.userdata.encoding" = "base64"
  }
}
