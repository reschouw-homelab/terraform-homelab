resource "aws_route53_record" "homepage" {
  zone_id = data.aws_route53_zone.public.zone_id
  name = "dorwinia.com"
  type = "A"
  ttl = "300"
  records = [
    module.lb-1.public-ip
  ]
}
