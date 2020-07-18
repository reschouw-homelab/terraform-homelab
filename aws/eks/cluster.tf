resource "aws_eks_cluster" "homelab-cluster" {
  name = "homelab-cluster"
  role_arn = aws_iam_role.homelab-cluster-role.arn
  
  vpc_config {
    subnet_ids = [
      for subnet in data.aws_subnet.us-west-2 : subnet.id
    ]
  }
  
  tags = {
    terraform = true
  }
}
