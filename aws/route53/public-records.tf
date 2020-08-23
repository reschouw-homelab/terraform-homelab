# Base website --------------------------------------------
resource "aws_route53_record" "root-website" {
  zone_id = aws_route53_zone.dorwinia-public.id
  name = "dorwinia.com"
  type = "A"
  ttl = var.ttl

  records = [
    var.home-ip
  ]
}

# Publicly reachable sites: --------------------------------
resource "aws_route53_record" "public-sites" {
  for_each = var.public-sites
  
  zone_id = aws_route53_zone.dorwinia-public.id
  name = "${each.key}.dorwinia.com"
  type = "A"
  ttl = var.ttl

  records = [
    each.value
  ]
}

# Zoho Mail Servers -----------------------------------------
resource "aws_route53_record" "zoho-mail" {
  zone_id = aws_route53_zone.dorwinia-public.id
  name = "dorwinia.com"
  type = "MX"
  ttl = var.ttl
  
  records = [
    "10 mx.zoho.com",
    "20 mx2.zoho.com",
    "50 mx3.zoho.com",
  ]
}

resource "aws_route53_record" "zoho-spf" {
  zone_id = aws_route53_zone.dorwinia-public.id
  name = "dorwinia.com"
  type = "TXT"
  ttl = var.ttl
  
  records = [
    "v=spf1 include:zoho.com ~all",
  ]
}

resource "aws_route53_record" "zoho-dkim" {
  zone_id = aws_route53_zone.dorwinia-public.id
  name = "dorwinia._domainkey.dorwinia.com"
  type = "TXT"
  ttl = var.ttl
  
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBbreWQ6wQLWTjpLqUfhMHuNeklu9xsOlRb5keijR1GI9N7r0gJNRhI0PgTXEdWJW0jtAiYFHPSrr21gXYL5bHi/8jdbi0tPCwg2MOwKVvsG3PQ4e/jYVZ5q4S+ikGM51SvFnXteUkmVqfOe7BzSUrcJN3RbBGBOTbC+QSFzeBxQIDAQAB",
  ]
}
