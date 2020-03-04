resource "aws_ecs_task_definition" "default" {
  family                = "nginx"
  container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
    "image": "342184921355.dkr.ecr.us-east-1.amazonaws.com/nginx-proxy:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 512,
    "cpu": 1024
  }
]
DEFINITION
}
