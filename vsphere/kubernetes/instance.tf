module "kube-controller-1" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"

  hostname = "kube-controller-1"
  playbook = "kubernetes.yml"
  ip-address = "192.168.1.80/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 16
  template = "ubuntu-18-04-20200810233459"
}

module "kube-worker" {
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//vsphere/modules/vsphere-instance?ref=vsphere-instance-v1.0"
  count = 3

  hostname = "kube-worker-${count.index+1}"
  playbook = "kubernetes.yml"
  ip-address = "192.168.1.${83+count.index}/24"
  gateway = "192.168.1.1"
  dns-servers = "192.168.1.11, 192.168.1.12"
  num-cpus = 2
  memory = 2048
  disk-size = 16
  template = "ubuntu-18-04-20200810233459"
}
