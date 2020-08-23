resource "aws_route53_zone" "dorwinia-private" {
  name = "dorwinia.com"
  comment = "Homelab Private Zone"
 
  vpc {
    vpc_id  = data.aws_vpc.us-west-2.id
  } 

  tags = {
    terraform = true
  }
}
