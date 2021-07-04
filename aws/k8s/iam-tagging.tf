resource "aws_iam_instance_profile" "worker-bootstrap" {
  name = "worker-bootstrap"
  role = aws_iam_role.worker-bootstrap.name
}

#Creating a role, setting who can use it
resource "aws_iam_role" "worker-bootstrap" {
  name               = "worker-bootstrap"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

#Creating the policy, attaching the permissions to it
resource "aws_iam_policy" "worker-bootstrap" {
  name   = "worker-bootstrap"
  policy = data.aws_iam_policy_document.worker-bootstrap.json
}

#Attaching the policy to the role
resource "aws_iam_role_policy_attachment" "iam_profile" {
  role       = aws_iam_role.worker-bootstrap.name
  policy_arn = aws_iam_policy.worker-bootstrap.arn
}

#The actual list of permissions to be granted
data "aws_iam_policy_document" "worker-bootstrap" {
  statement {
    sid    = "AllowInstanceToTagItself"
    effect = "Allow"
    actions = [
      "ec2:CreateTags",
      "ec2:DescribeInstances",
    ]
    resources = ["*"]
  }
}

#Setting the user / service that can use a thing
data "aws_iam_policy_document" "ec2_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
