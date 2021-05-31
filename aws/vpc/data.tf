data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}
