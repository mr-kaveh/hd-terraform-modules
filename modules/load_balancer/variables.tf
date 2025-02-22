variable "name" {
  description = "Name of the load balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Type of load balancer"
  type        = string
  default     = "application"
}

variable "security_groups" {
  description = "List of security group IDs for the load balancer"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}

variable "health_check_interval" {
  description = "Health check interval for the target group"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Health check timeout for the target group"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Healthy threshold for the target group"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold for the target group"
  type        = number
  default     = 2
}

variable "listener_port" {
  description = "Port for the load balancer listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the load balancer listener"
  type        = string
}