resource "vsphere_virtual_machine" "instance" {
  name             = "terraform-test"
  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout = 0
  resource_pool_id = data.vsphere_resource_pool.default-pool.id
  datastore_id = data.vsphere_datastore.esxi-4-local.id
  num_cpus = 2
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.vm-net.id
  }

  disk {
    label = "disk0"
    size  = 20
  }
}
