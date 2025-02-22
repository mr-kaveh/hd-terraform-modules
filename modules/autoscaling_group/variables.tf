variable "name_prefix" {
  description = "Prefix for the Auto Scaling Group name"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
}

variable "health_check_type" {
  description = "Type of health check for the ASG"
  type        = string
  default     = "ELB"
}

variable "target_group_arns" {
  description = "ARNs of the target groups for the ASG"
  type        = list(string)
}

variable "launch_template_id" {
  description = "ID of the launch template for the ASG"
  type        = string
}