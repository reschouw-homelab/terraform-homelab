module "netbox" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "netbox"
  #ip-address = "10.1.4.11"
  subnet = "us-west-2-dmz"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.netbox.id]
  playbook = "netbox.yml"
}

output "public_ips" {
  value = module.netbox.public-ip
}
