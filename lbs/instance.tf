module "lb-1" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  spot-instance = true
  associate-public-ip = true

  hostname = "lb-1"
  subnet = "us-west-2-dmz"
  custom-security-group-ids = [
    aws_security_group.lb.id
  ]

  playbook = "lb.yml"
}

