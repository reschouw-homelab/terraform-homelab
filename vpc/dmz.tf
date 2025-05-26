resource "aws_subnet" "dmz" {
  vpc_id                  = aws_vpc.main.id
  availability_zone_id    = "usw2-az2"
  cidr_block             = cidrsubnet(var.vpc_cidr, 8, 4)
  map_public_ip_on_launch = true

  tags = {
    Name = "us-west-2-dmz"
  }
}

resource "aws_route_table" "dmz" {
  vpc_id = aws_vpc.main.id
  
  # Note that the default route to the connected subnet is included automagically,
  # so does not need to be specified here.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "us-west-2-dmz"
  }
}

resource "aws_route_table_association" "dmz" {
  subnet_id      = aws_subnet.dmz.id
  route_table_id = aws_route_table.dmz.id
}
