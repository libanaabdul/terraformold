resource "aws_ecr_repository" "repository-ecs" {
  name                 = "repository-ecs"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
