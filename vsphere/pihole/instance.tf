module "dns-3" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "dns-3"
  playbook = "dns.yml"
  ip-address = "192.168.1.13/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 8
  template = "ubuntu-18-04-20200810233459"
}
