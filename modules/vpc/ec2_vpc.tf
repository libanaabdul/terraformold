resource "aws_vpc" "vpc-dev" {
  cidr_block           = var.ec2_vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "VPC-DEV"
  }
}

