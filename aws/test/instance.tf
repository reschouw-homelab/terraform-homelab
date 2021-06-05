module "module-test" {
  #source = "git@git.dorwinia.com:homelab/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "module-test"
  ip-address = "10.1.0.10"
  subnet = "us-west-2a"

  playbook = "common.yml"
}

