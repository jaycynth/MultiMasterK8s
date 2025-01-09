variable "name" {
  description = "Name for the NAT Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID where the NAT Gateway will be deployed"
  type        = string
}

variable "private_route_table_id" {
  description = "The private route table ID to associate the NAT Gateway"
  type        = string
}
