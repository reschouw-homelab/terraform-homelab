resource "aws_security_group" "lb" {
  name        = "lb"
  description = "Allow inbound access to lbs"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "All traffic from internal networks"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }

  ingress {
    description      = "HTTP from all networks"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description      = "HTTPS from all networks"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [
      "0.0.0.0/0",
    ]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  tags = {
    Name = "lb"
  }
}
