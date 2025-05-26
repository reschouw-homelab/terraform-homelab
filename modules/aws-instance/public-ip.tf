resource "aws_eip" "instance" {
  count = (var.associate-public-ip-address && var.associate-elastic-ip-address) ? 1 : 0
  instance = var.spot-instance ? aws_spot_instance_request.instance[0].spot_instance_id : aws_instance.instance[0].id
  domain = "vpc"
}
