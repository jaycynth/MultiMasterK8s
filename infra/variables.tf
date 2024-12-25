variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "subnet_count" {
  description = "Number of subnets to create"
  default     = 3
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 3
}
