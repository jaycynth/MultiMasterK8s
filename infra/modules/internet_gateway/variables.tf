variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet to associate with the route table"
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the public subnet to associate with the route table"
  type        = string
}

variable "igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "public_route_table_name" {
  description = "The name of the route table"
  type        = string
  default     = "public-route-table"
}


variable "private_route_table_name" {
  description = "The name of the route table"
  type        = string
  default     = "private-route-table"
}

variable "nat_gateway_id" {
  type = string
  
}