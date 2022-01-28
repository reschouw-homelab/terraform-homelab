data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_subnet" "us-west-2c" {
  tags = {
    Name = "us-west-2a"
  }
}
