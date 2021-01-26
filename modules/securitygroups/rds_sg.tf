resource "aws_security_group" "rds1" {
    name = "sgport"
    description = "Access RDS"
    vpc_id = var.vpclib

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = var.security_cidr
    }

    tags = {
        Name = "Access Postgresql"
    }

}