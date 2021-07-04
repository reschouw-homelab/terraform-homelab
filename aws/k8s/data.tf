data "aws_ami" "k8s-worker" {
  owners = ["self"]
  name_regex = "k8s-worker-arm-*"
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

data "aws_secretsmanager_secret" "k8s-join" {
  name = "k8s-join-token"
}

data "aws_secretsmanager_secret_version" "k8s-join" {
  secret_id = "k8s-join-token"
  depends_on = [module.controller]
}

data "aws_vpc" "prod" {
  tags = {
    Name = "us-west-2"
  }
}

data "aws_subnet" "subnet" {
  for_each = toset( ["a", "b", "c", "d"] )
  tags = {
    Name = "us-west-2${each.key}"
  }
}
