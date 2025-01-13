# AWS provider and region
variable "aws_region" {
  default = "eu-west-1"
}

# VPC CIDR block
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

# Instance types
variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "master_instance_type" {
  default = "t2.medium"
}

variable "worker_instance_type" {
  default = "t2.medium"
}

# AMIs
variable "bastion_ami" {
  default = "ami-0a094c309b87cc107" 
}

variable "master_ami" {
  default = "ami-0a094c309b87cc107" 
}

variable "worker_ami" {
  default = "ami-0a094c309b87cc107" 
}

# Node counts
variable "master_count" {
  default = 3
}

variable "worker_count" {
  default = 2
}

variable "bastion_count" {
  default = 1
}

variable "availability_zones" {
  type = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}



variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"] 
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
