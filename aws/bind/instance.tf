module "bind" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "bind"
  ip-address = "10.1.1.111"
  subnet = "us-west-2b"
  custom-security-group-ids = [aws_security_group.bind.id]
  playbook = "bind.yml"
}
