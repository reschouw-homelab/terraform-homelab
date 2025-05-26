resource "aws_iam_role" "spot-fleet" {
  name = "k8s-spot-fleet"
  

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "spotfleet.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    terraform = true
  }
}

resource "aws_iam_role_policy_attachment" "spot-fleet" {
  role = aws_iam_role.spot-fleet.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole" 
}
