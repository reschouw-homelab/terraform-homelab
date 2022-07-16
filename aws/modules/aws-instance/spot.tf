resource "aws_spot_instance_request" "instance" {
  count = var.spot-instance ? 1 : 0

  wait_for_fulfillment = true
  instance_interruption_behavior = "stop"

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
  
  user_data = templatefile(
    "${path.module}/userdata.cfg",
    {
      hostname = var.hostname,
      domain = var.domain,
      ansible-playbook = var.ansible-playbook,
      ansible-branch = var.ansible-branch,
      ansible-groups = var.ansible-groups,
      ansible-key-id = local.ansible-key-id,
      ansible-key-secret = local.ansible-key-secret
    }
  )

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
}

# Note it would be ideal to use both count and for_each here to conditionally create multiple tags, but they are mutually exclusive
resource "aws_ec2_tag" "terraform" {
  count = var.spot-instance ? 1 : 0
  resource_id = aws_spot_instance_request.instance[0].spot_instance_id
  key = "terraform"
  value = true
}

resource "aws_ec2_tag" "spot" {
  count = var.spot-instance ? 1 : 0
  resource_id = aws_spot_instance_request.instance[0].spot_instance_id
  key = "spot"
  value = true
}

resource "aws_ec2_tag" "key" {
  count = var.spot-instance ? 1 : 0
  resource_id = aws_spot_instance_request.instance[0].spot_instance_id
  key = "Name"
  value = "${var.hostname}.${var.domain}"
}
