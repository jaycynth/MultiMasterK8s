variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "is_public" {
  description = "Whether the subnet is public"
  type        = bool
}

variable "name" {
  description = "Name of the subnet"
  type        = string
  default     = "k8s-subnet"
}
