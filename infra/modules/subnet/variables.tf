variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zone" {
  type = string
}


variable "public_ip_on_launch" {
  description = "Whether to associate a public IP address with the subnet"
  type        = bool
  default     = false
}