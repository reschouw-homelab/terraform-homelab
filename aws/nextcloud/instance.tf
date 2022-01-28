module "nextcloud" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true
  instance-type = "t4g.micro"

  hostname = "nextcloud"
  subnet = "us-west-2c"

  playbook = "common.yml"
}

