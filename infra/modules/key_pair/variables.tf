variable "key_pair_name" {
  description = "Name for the key pair"
  type        = string
}

variable "algorithm" {
  description = "Algorithm for key generation"
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "Number of RSA bits"
  type        = number
  default     = 4096
}
