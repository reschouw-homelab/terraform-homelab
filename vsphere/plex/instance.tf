module "ans-1" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "plex.dorwinia.com"
  playbook = "common.yml"
  ip-address = "192.168.1.147/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 4
  memory = 8092
  disk-size = 8
  template = "ubuntu-18-04-20200810233459"
}

