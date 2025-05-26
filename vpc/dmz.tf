resource "aws_subnet" "us-west-2-dmz" {
  vpc_id     = aws_vpc.main.id
  availability_zone_id = "usw2-az2"
  cidr_block = "10.1.4.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "us-west-2-dmz"
  }
}

resource "aws_route_table" "dmz-subnet" {
  vpc_id = aws_vpc.main.id
  
  # Note that the default route to the connected subnet is included automagically,
  # so does not need to be specified here.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "us-west-2-dmz"
    terraform = true
  }
}

resource "aws_route_table_association" "dmz-subnet" {
  subnet_id = aws_subnet.us-west-2-dmz.id
  route_table_id = aws_route_table.dmz-subnet.id
}
