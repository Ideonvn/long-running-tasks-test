aws ecs run-task \
    --profile test \
    --region us-east-1 \
    --cluster test-ecs-cluster \
    --launch-type FARGATE \
    --network-configuration "awsvpcConfiguration={subnets=subnet-0951e826de9eda74a,securityGroups=sg-0df5d4149d2063229}" \
    --task-definition arn:aws:ecs:us-east-1:289259676022:task-definition/test-task-family:2Q