resource "aws_instance" "serverlib" {
  ami                         = var.ami 
  instance_type               = var.instance_type
  count                       = 1 
  subnet_id                   = var.subnet1
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sgmonitor]
  key_name                    = aws_key_pair.ec2key.id 
  tags = {
    Name = "serverlib"
    Env  = "qa"
  }
}

