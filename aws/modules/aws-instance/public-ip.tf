resource "aws_eip" "instance" {
  count = var.associate-public-ip ? 1 : 0
  instance = var.spot-instance ? aws_spot_instance_request.instance[0].spot_instance_id : aws_instance.instance[0].id
  vpc = true
}
