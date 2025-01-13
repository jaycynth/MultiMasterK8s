variable "lb_name" {
  description = "Name of the internal load balancer"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs for the load balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the load balancer is deployed"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
}

variable "health_check_interval" {
  description = "Interval for health checks"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout for health checks"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for health checks"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for health checks"
  type        = number
  default     = 2
}

variable "health_check_protocol" {
  description = "Protocol for health checks"
  type        = string
  default     = "HTTP"
}

variable "target_ids" {
  description = "List of target IDs (master node instance IDs)"
  type        = list(string)
}
