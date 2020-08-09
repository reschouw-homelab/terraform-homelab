resource "aws_route53_record" "ses-txt" {
  zone_id = data.aws_route53_zone.dorwinia.zone_id
  name    = "_amazonses.dorwinia.com"
  type    = "TXT"
  ttl     = "1800"
  records = ["sl2f0dwF2n0Dr1qb7BYGkJSY1l9OfJN76++xfZV355E="]
}

resource "aws_route53_record" "ses-dkim" {
  for_each = var.dkim-records
  zone_id = data.aws_route53_zone.dorwinia.zone_id
  name    = each.key
  type    = "CNAME"
  ttl     = "1800"
  records = [each.value]
}
