resource "aws_key_pair" "ec2key" {
  key_name   = "ec2_key"
  public_key = file("example.pem.pub")
}

