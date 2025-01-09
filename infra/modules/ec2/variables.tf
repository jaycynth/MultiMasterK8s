variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group" {
  type = string
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = false
}


variable "key_pair_name" {
  type = string
  default = "k8s_key"
  
}