variable "subnet1_cidr" {
  description = "Subnet DEV"
  default = "10.0.10.0/24"

}
variable "subnet1_zone_1a" {
  description = "Zone1a_subnetdev"
  default = "us-east-1a"
 
}

variable "subnet2_cidr" {
  description = "subent2_vpc_cidr"
  default     = "10.0.20.0/24"
}

variable "subnet2_zone_1b" {
  description = "Zone1b_subnet2"
  default     = "us-east-1b"
}

variable "vpclib" {
  
}