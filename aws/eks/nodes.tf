resource "aws_eks_node_group" "homelab-nodes" {
  cluster_name = aws_eks_cluster.homelab-cluster.name
  node_group_name = "homelab-nodes"
  node_role_arn = aws_iam_role.homelab-node-role.arn
  subnet_ids = values(data.aws_subnet.us-west-2)[*].id
  
  instance_types = [
    "t3.small"
  ]

  disk_size = 8

  scaling_config {
    desired_size = 1
    max_size = 1
    min_size = 1
  }
  
  # Note that applying tags to ec2 worker nodes is not supported
  tags = {
    terraform = true
  }
}
