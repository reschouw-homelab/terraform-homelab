module "gitlab-runners" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"
  count = 2
  hostname = "gitlab-runner-${count.index+1}"
  playbook = "gitlab-runner.yml"
  ip-address = "192.168.1.${71 + count.index}/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 4096
  disk-size = 8
  template = "ubuntu-18-04-20200810233459"
}
