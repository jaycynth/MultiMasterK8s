variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table for public subnets"
  type        = string
}

variable "name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "k8s-internet-gateway"
}
