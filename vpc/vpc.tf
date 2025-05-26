resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = true  
  tags = {
    Name = "us-west-2"
  }
}
