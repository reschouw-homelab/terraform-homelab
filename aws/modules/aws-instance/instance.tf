resource "aws_instance" "instance" {
  ami = data.aws_ami.instance-ami.id
  key_name = "dorwin@config.dorwinia.com"
  instance_type = var.instance-type
  
  subnet_id = data.aws_subnet.us-west-2a.id
  private_ip = var.ip-address

  root_block_device {
    volume_size = var.disk-size
  }
  
  user_data = templatefile("${path.module}/userdata.cfg",{hostname = var.hostname, playbook = var.playbook, domain = var.domain})
  tags = {
    terraform = true
    Name = "${var.hostname}.${var.domain}"
  }
}
