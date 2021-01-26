resource "aws_subnet" "subnet1" {
  vpc_id                  = var.vpclib
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet1_zone_1a

  tags = {
    Name = "Subnetdev"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = var.vpclib
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet2_zone_1b

  tags = {
    Name = "Subnet2"
  }
}

resource "aws_internet_gateway" "gw-dev" {
  vpc_id = var.vpclib

  tags = {
    Name = "GatewayDEV"
  }
}

resource "aws_route_table" "route-dev" {
  vpc_id = var.vpclib
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-dev.id
  }
}

resource "aws_route_table_association" "table_subnet" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route-dev.id
}

resource "aws_db_subnet_group" "dbsubnet" {
    name = "db_subnet"
    subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    tags = {
        Name = "DBSubnetDEV"
    }
}
