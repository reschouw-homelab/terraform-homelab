data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_instance" "wireguard-2" {
  filter {
    name = "tag:Name"
    values = ["wireguard-2.dorwinia.com"]
  }
}
