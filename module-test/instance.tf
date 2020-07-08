module "module-test-1" {
  source = "../modules/vsphere-instance"

  hostname = "module-test-1"
  ip-address = "192.168.1.233/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200705223153"
}

module "module-test-2" {
  source = "../modules/vsphere-instance"

  hostname = "module-test-2"
  ip-address = "192.168.1.234/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200705223153"
}
