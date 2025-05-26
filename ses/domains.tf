resource "aws_ses_domain_identity" "dorwinia" {
  domain = "dorwinia.com"
}

resource "aws_ses_domain_dkim" "dorwinia" {
  domain = aws_ses_domain_identity.dorwinia.domain
}
