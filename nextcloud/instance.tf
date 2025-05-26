module "nextcloud" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.10"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true
  instance-type = "t4g.small"
  ami-name = "nextcloud-resizing"

  hostname = "nextcloud"
  subnet = "us-west-2c"
  disk-size = 32

  playbook = "common.yml"
}

