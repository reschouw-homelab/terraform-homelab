module "module-test" {
  #source = "git@git.dorwinia.com:homelab/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = false

  hostname = "module-test"
  subnet = "us-west-2a"

  playbook = "common.yml"
}

