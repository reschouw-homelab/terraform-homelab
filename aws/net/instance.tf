module "tunnel-box" {
  count = 2
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.1"
  
  hostname = "tun-${count.index + 1}"
  ip-address = "10.1.${count.index}.10"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.tunnel-box.id]
  playbook = "wireguard.yml"
}

output "public_ips" {
  value = module.tunnel-box[*].public-ip
}
