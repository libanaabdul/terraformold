resource "aws_security_group" "sgmonitor" {
  name        = "sp-http"
  description = "Allow HTTP/S"
  vpc_id      = var.vpclib

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["200.91.206.98/32", "200.91.207.130/32","0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["200.91.206.98/32", "200.91.207.130/32", "0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "HTTP/S"
  }
}

resource "aws_security_group" "sg-lb" {
  name        = "elb_http"
  description = "Allow trafic to lb"
  vpc_id      = var.vpclib

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow trafic to lb"
  }
}

resource "aws_security_group" "sg-vpn" {
  name   = "SG-VPN"
  vpc_id = var.vpclib

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "all traffic VPN"
  }
}
