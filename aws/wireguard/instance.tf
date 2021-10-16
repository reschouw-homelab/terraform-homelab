module "wireguard" {
  source = "git@github.com:reschouw/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v3.9"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "wireguard"
  ip-address = "10.1.4.11"
  subnet = "us-west-2-dmz"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.wireguard.id]
  playbook = "wireguard.yml"
}

output "public_ips" {
  value = module.wireguard.public-ip
}
