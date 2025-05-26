moved {
  from = aws_route53_record.private-dns
  to = aws_route53_record.private
}

moved {
  from = aws_route53_record.public-dns[0]
  to = aws_route53_record.public[0]
}
