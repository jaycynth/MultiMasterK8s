variable "name" {
  description = "Name of the load balancer"
  type        = string
  default     = "app-load-balancer"
}

variable "is_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "Security group IDs for the load balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the load balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
  default     = "app-target-group"
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
  default     = "HTTP"
}

variable "target_type" {
  description = "Target type for the target group (e.g., instance, ip)"
  type        = string
  default     = "instance"
}

variable "listener_port" {
  description = "Port for the load balancer listener"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the load balancer listener"
  type        = string
  default     = "HTTP"
}
