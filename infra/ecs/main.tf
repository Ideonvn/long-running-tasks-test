provider "aws" {
  region = "us-east-1"
  profile = "test"
}

resource "aws_ecs_cluster" "test_cluster" {
  name = "test-ecs-cluster"
}

output "cluster" {
  value = aws_ecs_cluster.test_cluster.name
}
