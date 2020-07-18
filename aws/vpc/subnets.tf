resource "aws_subnet" "us-west-2" {
  for_each = var.az-map
  vpc_id     = aws_vpc.main.id
  availability_zone_id = data.aws_availability_zones.available.zone_ids["${each.value}"]
  cidr_block = "10.1.${each.value}.0/24"

  tags = {
    Name = "us-west-2${each.key}"
  }
}
