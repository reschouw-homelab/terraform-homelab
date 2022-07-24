module "nextcloud" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v4.0.0"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true
  instance-type = "t4g.small"
  ami-name = "nextcloud-before-aws-instance-v4"

  hostname = "nextcloud"
  subnet = "us-west-2c"
  disk-size = 16

  ansible-playbook = "common.yml"
}

