module "config" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.3"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "config"
  ami-name = "config.dorwinia.com-2021-05-01"
  ip-address = "10.1.4.254"
  subnet = "us-west-2-dmz"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.config.id]
  playbook = "common.yml"
}

output "public_ips" { 
  value = module.config.public-ip
}
