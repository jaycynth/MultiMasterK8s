variable "key_pair_name" {
  type = string
  default = "k8s_key"
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instances"
  type        = string
}

variable "security_group" {
  description = "Security group for the EC2 instances"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with the instance"
  type        = bool
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}
