resource "aws_security_group" "netbox" {
  
  name = "netbox"
  description = "Allows incoming access form all RFC 1918 addresses"
  vpc_id = data.aws_vpc.us-west-2.id
  
  ingress {
    description = "Allow incoming connections from RFC 1918 space"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "192.168.0.0/16",
      "172.16.0.0/12",
      "10.0.0.0/8",
    ]
  }

  ingress {
    description = "Allow incoming Wireguard connections"
    from_port = 51820
    to_port = 51820
    protocol = "TCP"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description = "Allow incoming Wireguard connections"
    from_port = 51820
    to_port = 51820
    protocol = "UDP"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    description = "Allow all outgoing connections"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  
  tags = {
    terraform = true
    Name = "netbox"
  }
}
