resource "aws_ecs_task_definition" "service" {
  family                = "service"
  container_definitions = file("service.json")
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  network_mode             = "awsvpc"
}

