module "lb-1" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v4.0.0"
  
  spot-instance = true
  associate-public-ip-address = true
  associate-elastic-ip-address = true

  hostname = "lb-1"
  subnet = "us-west-2-dmz"
  custom-security-group-ids = [
    aws_security_group.lb.id
  ]

  ansible-playbook = "lb.yml"
}

