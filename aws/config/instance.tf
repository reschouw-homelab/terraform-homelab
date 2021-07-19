module "config" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "config"
  ami-name = "ubuntu-20-04-arm-*"
  instance-type = "t4g.micro"
  disk-size = 12
  subnet = "us-west-2-dmz"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.config.id]
}

output "public_ips" { 
  value = module.config.public-ip
}
