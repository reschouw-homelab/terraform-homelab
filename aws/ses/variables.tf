variable "dkim-records" {
  description = "dkim records for aws ses"
  default = {
    "5c2u5dnrmw43ejjg2tupirvzqc2zxcqq._domainkey.dorwinia.com" = "5c2u5dnrmw43ejjg2tupirvzqc2zxcqq.dkim.amazonses.com"
    "qqusdsxmwmguwyanjqmxf6g5vbc4ax4t._domainkey.dorwinia.com" = "qqusdsxmwmguwyanjqmxf6g5vbc4ax4t.dkim.amazonses.com"
    "dxiq4wmhduzndbkxtecysnjy3kmvp7ka._domainkey.dorwinia.com" = "dxiq4wmhduzndbkxtecysnjy3kmvp7ka.dkim.amazonses.com"
  }
}
