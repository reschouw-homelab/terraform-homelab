resource "aws_instance" "instance" {
  count = var.spot-instance ? 0 : 1
  
  ami = data.aws_ami.instance-ami.id
  key_name = "dorwin@config.dorwinia.com"
  instance_type = var.instance-type
  
  subnet_id = data.aws_subnet.subnet.id
  private_ip = var.ip-address
  source_dest_check = var.source-dest-check

  vpc_security_group_ids = (length(var.custom-security-group-ids) == 0) ? [data.aws_security_group.dorwinia-default.id] : var.custom-security-group-ids

  iam_instance_profile = var.instance-profile
  
  root_block_device {
    volume_size = var.disk-size
  }
  
  user_data = templatefile("${path.module}/userdata.cfg",{hostname = var.hostname, playbook = var.playbook, domain = var.domain, ansible-key-id = local.ansible-key-id, ansible-key-secret = local.ansible-key-secret})

  maintenance_options {
    auto_recovery = "default"
  }

  lifecycle {
    ignore_changes = [
      ami,
      user_data,
      ebs_optimized,
      user_data_replace_on_change,
    ]
  }

  tags = {
    Name = "${var.hostname}.${var.domain}"
  }
}
