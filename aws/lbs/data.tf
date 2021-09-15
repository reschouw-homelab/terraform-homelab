data "aws_vpc" "main" {
  tags = {
    Name = "us-west-2"
  }
}
