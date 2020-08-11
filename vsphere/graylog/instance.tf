module "graylog" {
  source = "../modules/vsphere-instance"

  hostname = "graylog"
  playbook = "common.yml"
  ip-address = "192.168.1.148/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 16
  template = "ubuntu-18-04-20200810233459"
}
