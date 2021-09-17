data "aws_vpc" "main" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_route53_zone" "public" {
  name = "dorwinia.com"
  private_zone = false
}
