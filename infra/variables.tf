# AWS provider and region
variable "aws_region" {
  default = "eu-west-1"
}

# VPC CIDR block
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

# Subnet CIDR blocks
variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zone1" {
  default = "eu-west-1a"
}

variable "availability_zone2" {
  default = "eu-west-1b"
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