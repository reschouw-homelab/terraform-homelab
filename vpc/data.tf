data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_instance" "netbox" {
  filter {
    name   = "tag:Name"
    values = ["netbox.dorwinia.com"]
  }
}
