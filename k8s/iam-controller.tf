resource "aws_iam_instance_profile" "k8s-controller" {
  name = "k8s-controller"
  role = aws_iam_role.k8s-controller.name
  tags = {
    terraform = true
  }
}

resource "aws_iam_role" "k8s-controller" {
  name = "k8s-controller"
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.controller-assume-role.json

  tags = {
    terraform = true
  }
}

data "aws_iam_policy_document" "controller-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "k8s-join-creds-upload" {
  name = "k8s-join-creds-upload"
  description = "Allow instance to upload it's kubeadm join credentials to AWS Secrets Service"
  path = "/"
  
  policy = data.aws_iam_policy_document.k8s-join-creds-upload.json

  tags = {
    terraform = true
  }
}

data "aws_iam_policy_document" "k8s-join-creds-upload" {
  statement {
    actions = [
      "secretsmanager:PutSecretValue",
    ]
    effect = "Allow"
    resources = ["${data.aws_secretsmanager_secret.k8s-join.arn}"]
  }
}
