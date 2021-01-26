variable "ecs_cluster" {
  description = "ECS cluster name"
  default = "cluster-qa"
}
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "port-alb" {
  description = "port"
  default = "80"
 }

variable "port-tg" {
  description = "port"
  default = "80"
 }