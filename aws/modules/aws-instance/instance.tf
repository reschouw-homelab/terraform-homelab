resource "aws_instance" "instance" {
  ami = data.aws_ami.instance-ami.id
  key_name = "dorwin@config.dorwinia.com"
  instance_type = var.instance-type
  
  subnet_id = data.aws_subnet.subnet.id
  private_ip = var.ip-address
  associate_public_ip_address = var.associate-public-ip
  
  vpc_security_group_ids = (length(var.custom-security-group-ids) == 0) ? [data.aws_security_group.dorwinia-default.id] : var.custom-security-group-ids
  
  root_block_device {
    volume_size = var.disk-size
  }
  
  user_data = templatefile("${path.module}/userdata.cfg",{hostname = var.hostname, playbook = var.playbook, domain = var.domain, ansible-key-id = local.ansible-key-id, ansible-key-secret = local.ansible-key-secret})

  lifecycle {
    ignore_changes = [
      user_data,
      ebs_optimized,
    ]
  }

  tags = {
    terraform = true
    Name = "${var.hostname}.${var.domain}"
  }
}
