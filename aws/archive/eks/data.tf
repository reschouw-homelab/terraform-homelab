data "aws_subnet" "us-west-2" {
  for_each = toset(["a", "b", "c", "d"])
  tags = {
   Name = "us-west-2${each.key}"
  }
}

data "aws_iam_policy" "eks-cluster"{
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "eks-service"{
  arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

data "aws_iam_policy" "eks-workers"{
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "eks-cni"{
  arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "eks-registry-ro"{
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
