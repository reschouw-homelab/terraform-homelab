resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.us-west-2.id

  tags = {
    Name = "us-west-2"
  }
}
