resource "aws_subnet" "main" {
  for_each = var.az_map

  vpc_id                  = aws_vpc.main.id
  availability_zone_id    = data.aws_availability_zones.available.zone_ids[each.value]
  cidr_block             = cidrsubnet(var.vpc_cidr, 8, each.value)
  map_public_ip_on_launch = false

  tags = {
    Name = "us-west-2${each.key}"
  }
}

resource "aws_route_table" "main" {
  for_each = var.az_map

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    network_interface_id    = data.aws_instance.netbox.network_interface_id
  }

  tags = {
    Name = "us-west-2${each.key}"
  }
}

resource "aws_route_table_association" "main" {
  for_each = var.az_map

  subnet_id      = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.main[each.key].id
}
