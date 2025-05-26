resource "aws_route53_record" "control-plane" {
  zone_id = "Z086744537AWZ24ZBLDOP"
  name = "kube-control.dorwinia.com"
  type = "A"
  ttl = "300"
  records = [module.controller.private-ip]
}
