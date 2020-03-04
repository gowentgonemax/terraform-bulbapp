resource "aws_ecs_service" "default" {
  	name            = "api-01"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.default.id}"
  	task_definition = "${aws_ecs_task_definition.default.family}:${max("${aws_ecs_task_definition.default.revision}", 0)}"
  	desired_count   = 3

  	load_balancer {
    	target_group_arn  = "${aws_lb_target_group.default.arn}"
    	container_port    = 80
    	container_name    = "bulbapp"
	}
}
resource "aws_ecs_task_definition" "default" {
  family                = "bulbapp"
  container_definitions = <<DEFINITION
[
  {
    "name": "bulbapp",
    "image": "342184921355.dkr.ecr.us-east-1.amazonaws.com/nginx-proxy",
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
