module "dns-1" {
  source = "../modules/vsphere-instance"

  hostname = "dns-1"
  playbook = "dns_update.yml"
  ip-address = "192.168.1.11/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 1024
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}

module "dns-2" {
  source = "../modules/vsphere-instance"

  hostname = "dns-2"
  playbook = "dns_update.yml"
  ip-address = "192.168.1.12/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 1024
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}
