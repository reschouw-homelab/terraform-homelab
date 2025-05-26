resource "aws_security_group" "kube-worker" {
  name        = "kube-worker"
  description = "security group allowing neccessary communication for kubernetes workers."
  vpc_id      = data.aws_vpc.prod.id

  ingress {
    description      = "Inbound RFC1918"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kube-worker"
    terraform = true
  }
}
