resource "aws_iam_role" "homelab-node-role" {
  name = "homelab-node-role"
  assume_role_policy = data.aws_iam_policy_document.homelab-node-policy.json
}

data "aws_iam_policy_document" "homelab-node-policy" {
  statement {
    sid = "AllowNodeToAssumeRole"
    
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "homelab-eks-workers" {
  policy_arn = data.aws_iam_policy.eks-workers.arn
  role = aws_iam_role.homelab-node-role.name
}

resource "aws_iam_role_policy_attachment" "homelab-eks-cni" {
  policy_arn = data.aws_iam_policy.eks-cni.arn
  role = aws_iam_role.homelab-node-role.name
}

resource "aws_iam_role_policy_attachment" "homelab-eks-registry-ro" {
  policy_arn = data.aws_iam_policy.eks-registry-ro.arn
  role = aws_iam_role.homelab-node-role.name
}
