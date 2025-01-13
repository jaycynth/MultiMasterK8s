
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone1" {
  description = "Availability zone for the public subnet"
  type        = string
  default     = "eu-west-1a"
}

variable "availability_zone2" {
  description = "Availability zone for the private subnet"
  type        = string
  default     = "eu-west-1b"
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "bastion_ami" {
  description = "AMI for the bastion host"
  type        = string
    default = "ami-0a094c309b87cc107"

}

variable "master_instance_type" {
  description = "Instance type for the master nodes"
  type        = string
  default     = "t2.medium"
}

variable "master_ami" {
  description = "AMI for the master nodes"
  type        = string
    default = "ami-0a094c309b87cc107"

}

variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 3
}

variable "worker_instance_type" {
  description = "Instance type for the worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "worker_ami" {
  description = "AMI for the worker nodes"
  type        = string
  default = "ami-0a094c309b87cc107"
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

