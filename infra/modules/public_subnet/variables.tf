variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for the public subnets"
  type        = list(string)
}

variable "subnet_name_prefix" {
  description = "Prefix for naming the public subnets"
  type        = string
}
