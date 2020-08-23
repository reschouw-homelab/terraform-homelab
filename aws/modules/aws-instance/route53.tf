resource "aws_route53_record" "private-dns" {
  zone_id = data.aws_route53_zone.private.zone_id
  name = "${var.hostname}.${var.domain}"
  type = "A"
  ttl = 300
  records = [aws_instance.instance.private_ip]
}

resource "aws_route53_record" "public-dns" {
  count = var.associate-public-ip ? 1 : 0
  zone_id = data.aws_route53_zone.public.zone_id
  name = "${var.hostname}.${var.domain}"
  type = "A"
  ttl = 300
  records = [aws_instance.instance.public_ip]
}
