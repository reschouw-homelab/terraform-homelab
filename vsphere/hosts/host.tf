resource "vsphere_host" "esxi-1" {
  hostname = "esxi-1"
  username = ""
  password = ""  
  connected = true
  maintenance = false
  lockdown = "disabled"
}

resource "vsphere_host" "esxi-4" {
  hostname = "esxi-4"
  username = ""
  password = ""  
  connected = true
  maintenance = false
  lockdown = "disabled"
}
