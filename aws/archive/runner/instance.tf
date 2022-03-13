module "runner" {
  source = "git@github.com:reschouw-homelab/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true
  hostname = "runner"
  subnet = "us-west-2c"
  playbook = "runner.yml"
}

