variable "allocate_storage" {
  description = "Storage"
  default     = "10"
}

variable "name" {
  description = "name db"
  default     = "libdb"
}

variable "username" {
  description = "user db"
  default     = "usrlib"
}

variable "password" {
  default     = "BgcXP4tTsrK8Lmubd"
}

variable "instance_class" {
  description = "Instance Type"
  default = "db.t2.micro"
}

variable "vpclib" { 

}

variable "rds1" {
  
}

variable "dbsubnet" {
  
}