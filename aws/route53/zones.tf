resource aws_route53_zone "dorwinia-public" {
  name = "dorwinia.com"
  comment = "Homelab Public Zone"
  

  tags = {
    terraform = true
  }
}
