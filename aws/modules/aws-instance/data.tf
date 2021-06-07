# Fill in default value for ami_name variable
data "aws_ami" "instance-ami" {
  owners = ["self"]
  name_regex = var.ami-name
  most_recent = true
  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_security_group" "dorwinia-default" {
  name = "dorwinia-default"
}

data "aws_vpc" "us-west-2" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_subnet" "subnet" {
  tags = {
    Name = var.subnet
  }
}

data "aws_route53_zone" "public" {
  zone_id = "Z01305451GVLJFR6NY5S9"
}

data "aws_route53_zone" "private" {
  zone_id = "Z086744537AWZ24ZBLDOP"
}

data "aws_sns_topic" "slack-alerts" {
  name = "slack-alerts"
}

data "aws_secretsmanager_secret_version" "ansible-user-creds" {
  secret_id = "ansible-user-creds"
}
