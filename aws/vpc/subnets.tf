resource "aws_subnet" "us-west-2" {
  for_each = var.az-map
  vpc_id     = aws_vpc.main.id
  availability_zone_id = data.aws_availability_zones.available.zone_ids["${each.value}"]
  cidr_block = "10.1.${each.value}.0/24"
  
  map_public_ip_on_launch = true

  tags = {
    Name = "us-west-2${each.key}"
    "kubernetes.io/cluster/homelab-cluster" = "shared"
  }
}

resource "aws_route_table" "subnets" {
  for_each = var.az-map

  vpc_id = aws_vpc.main.id
  
  # Note that the default route to the connected subnet is included automagically,
  # so does not need to be specified here.

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "us-west-2${each.key}"
    terraform = true
  }
}

resource "aws_route_table_association" "subnets" {
  for_each = var.az-map
  
  subnet_id = aws_subnet.us-west-2[each.key].id
  route_table_id = aws_route_table.subnets[each.key].id
}
