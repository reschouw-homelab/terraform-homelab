resource "aws_iam_role" "homelab-cluster-role" {
  name = "homelab-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.homelab-cluster-policy.json
}

data "aws_iam_policy_document" "homelab-cluster-policy" {
  statement {
    sid = "AllowEksToAssumeRole"
    
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    # This creates a loop between the policy document and it's role
    #resources = [
    #  aws_iam_role.homelab-cluster-role.arn
    #]
  }
}

resource "aws_iam_role_policy_attachment" "homelab-eks-cluster" {
  policy_arn = data.aws_iam_policy.eks-cluster.arn
  role = aws_iam_role.homelab-cluster-role.name
}

resource "aws_iam_role_policy_attachment" "homelab-eks-service" {
  policy_arn = data.aws_iam_policy.eks-service.arn
  role = aws_iam_role.homelab-cluster-role.name
}
