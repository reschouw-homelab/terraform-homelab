module "wireguard-2" {
  source = "../modules/aws-instance"
  
  hostname = "wireguard-2"
  ip-address = "10.1.0.10"
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.wireguard-2.id]
}


output "public_ip" {
  value = module.wireguard-2.public-ip
}
