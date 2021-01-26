resource "aws_db_instance" "rds1" {
  allocated_storage = var.allocate_storage
  count             = 2
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "10.6"
  instance_class         = var.instance_class
  name                   = var.name
  username               = var.username
  password               = var.password
  port                   = "5432"
  db_subnet_group_name   = var.dbsubnet
  publicly_accessible    = true
  vpc_security_group_ids = [var.rds1]
  skip_final_snapshot    = true

  tags = {
    Name = "Server-${count.index}"
    Env  = "DEV"
  }
}