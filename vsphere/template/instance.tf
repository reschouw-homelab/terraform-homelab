module "ans-1" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "ans-1"
  playbook = "common.yml"
  ip-address = "192.168.1.51/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}

module "ans-2" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "ans-2"
  playbook = "common.yml"
  ip-address = "192.168.1.52/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200709140801"
}
