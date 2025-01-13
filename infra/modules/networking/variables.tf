variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "subnet_name_prefix" {
  description = "Prefix for naming the subnets"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway for private subnets"
  type        = string
}
