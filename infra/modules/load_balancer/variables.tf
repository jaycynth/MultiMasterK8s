variable "subnet_ids" {
  description = "List of subnet IDs where the load balancer will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the load balancer"
  type        = list(string)
}

variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
  default     = "k8s-lb"
}
