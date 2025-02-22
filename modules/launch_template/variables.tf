variable "name_prefix" {
  description = "Prefix for the launch template name"
  type        = string
}

variable "image_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "name" {
  description = "Name tag for the EC2 instances"
  type        = string
}

variable "tags" {
  description = "Additional tags for the EC2 instances"
  type        = map(string)
  default     = {}
}