resource "aws_route53_record" "private" {
  zone_id = data.aws_route53_zone.private.zone_id
  name = "${var.hostname}.${var.domain}"
  type = "A"
  ttl = 300
  records = [var.spot-instance ? aws_spot_instance_request.instance[0].private_ip : aws_instance.instance[0].private_ip]
}

resource "aws_route53_record" "public" {
  count = var.associate-public-ip-address ? 1 : 0
  zone_id = data.aws_route53_zone.public.zone_id
  name = "${var.hostname}.${var.domain}"
  type = "A"
  ttl = 300
  records = [
    # The following ridiculous looking logic is determining whether to use the elastic ip, or the public ip from either the spot or on-demand instance
    var.associate-elastic-ip-address ? (
      aws_eip.instance[0].public_ip 
    ) : (
      var.spot-instance ? ( 
        aws_spot_instance_request.instance[0].public_ip
      ) : (
        aws_instance.instance[0].public_ip
      )
    )
  ]
}
