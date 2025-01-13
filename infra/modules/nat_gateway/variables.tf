variable "public_subnet_id" {
  description = "ID of the public subnet where the NAT Gateway will be deployed"
  type        = string
}

variable "private_route_table_id" {
  description = "ID of the route table for private subnets"
  type        = string
}

variable "name" {
  description = "Name of the NAT Gateway"
  type        = string
  default     = "k8s-nat-gateway"
}
