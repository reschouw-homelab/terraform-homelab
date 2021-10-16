data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}
