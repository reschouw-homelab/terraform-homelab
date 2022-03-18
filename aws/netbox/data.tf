data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}


data "aws_route53_zone" "public" {
  zone_id = "Z01305451GVLJFR6NY5S9"
}

data "aws_route53_zone" "private" {
  zone_id = "Z086744537AWZ24ZBLDOP"
}
