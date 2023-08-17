provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "test_cluster" {
  name     = "test-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-23456789"]  # Update with your subnet IDs
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com",
        },
      },
    ],
  })
}

# Other resources like policies, role attachments, and workers can be added here
