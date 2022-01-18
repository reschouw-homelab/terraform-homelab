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

  ingress {
    description = "Allow connections from Homes"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "66.205.138.41/32", # Parents
      "24.17.190.133/32", # Home
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
    Name = "unifi"
  }
}
