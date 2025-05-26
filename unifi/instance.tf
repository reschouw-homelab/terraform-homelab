module "unifi" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "unifi"
  subnet = "us-west-2-dmz"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.unifi.id]
  instance-type = "t4g.micro"
  disk-size = 10
  playbook = "unifi.yml"
}

output "public_ips" {
  value = module.unifi.public-ip
}
