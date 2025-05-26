resource "aws_route53_record" "private-dns" {
  zone_id = data.aws_route53_zone.private.zone_id
  name = "files.dorwinia.com"
  type = "A"
  ttl = 300
  records = [data.aws_instance.lb.private_ip]
}

resource "aws_route53_record" "public-dns" {
  zone_id = data.aws_route53_zone.public.zone_id
  name = "files.dorwinia.com"
  type = "A"
  ttl = 300
  records = [data.aws_instance.lb.public_ip]
}
