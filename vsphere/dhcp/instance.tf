module "dhcp-1" {
  source = "../modules/vsphere-instance"

  hostname = "dhcp-1"
  playbook = "dhcp_config.yml"
  ip-address = "192.168.1.21/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 1024
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}

module "dhcp-2" {
  source = "../modules/vsphere-instance"

  hostname = "dhcp-2"
  playbook = "dhcp_config.yml"
  ip-address = "192.168.1.22/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 1024
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}
