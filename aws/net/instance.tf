module "tunnel-box" {
  count = 2
  source = "git@git.dorwinia.com:homelab/terraform-homelab.git//aws/modules/aws-instance?ref=aws-instance-v2.2"
  #source = "/home/dorwin/terraform-homelab/aws/modules/aws-instance"
  
  hostname = "tun-${count.index + 1}"
  ip-address = "10.1.${count.index}.10"
  subnet = var.num-list[count.index]
  associate-public-ip = true
  custom-security-group-ids = [aws_security_group.tunnel-box.id]
  playbook = "wireguard.yml"
}

variable "num-list" {
  description = "Used to map IP and Subnet names"
  type = list(string)
  default = [
    "us-west-2a",
    "us-west-2b",
  ]
}

output "public_ips" {
  value = module.tunnel-box[*].public-ip
}
