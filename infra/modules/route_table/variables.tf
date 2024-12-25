variable "vpc_id" {
  description = "VPC ID to associate with the route table"
}

variable "igw_id" {
  description = "Internet Gateway ID for the route table"
}

variable "subnet_ids" {
  description = "List of Subnet IDs to associate with the route table"
}
