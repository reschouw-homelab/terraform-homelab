resource "vsphere_host" "esxi-1" {
  hostname = "esxi-1"
  #datacenter = data.vsphere_datacenter.dc.id
  username = ""
  password = ""  
  connected = true
  maintenance = true
  lockdown = "disabled"
}
