variable "ec2_vpc_cidr" {
  description = "CIDR ec2_vpc"
  default = "10.0.0.0/16"
}

variable "security_cidr" {
  description = "CIDR SecurityGroup"
  default     = ["0.0.0.0/0", "200.91.207.130/32", "200.91.206.98/32"]
}

variable "vpclib" {
  
}