module "gitlab" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "gitlab"
  playbook = "common.yml"
  ip-address = "192.168.1.144/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 4
  memory = 8096
  disk-size = 16
  template = "ubuntu-18-04-20200709140801"
}
