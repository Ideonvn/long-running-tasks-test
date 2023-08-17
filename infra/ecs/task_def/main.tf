provider "aws" {
  region = "us-east-1"
  profile = "test"
}

resource "aws_ecs_task_definition" "test_task_definition" {
  family                   = "test-task-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  cpu = "256"  # Specify the CPU units
  memory = "512"  # Specify the memory in MiB

  container_definitions = jsonencode([
    {
      name  = "long_running_task",
      image = "ideonvn/long_running_task:test",
      essential = true,
    }
  ])
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

output "task_arn" {
  value = aws_ecs_task_definition.test_task_definition.arn
}
