resource "aws_security_group" "unifi" {
  
  name = "unifi"
  description = "Allows incoming access for Unifi Controller"
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

  #ingress {
  #  description = "Allow incoming Unifi Management connections"
  #  from_port = 
  #  to_port = 
  #  protocol = ""
  #  cidr_blocks = [
  #    "",
  #  ]
  #}

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
    Name = "unifi"
  }
}
