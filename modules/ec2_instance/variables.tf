variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instances"
  type        = string
}

variable "instance_prefix" {
  description = "Prefix for the instance names"
  type        = string
}

variable "environment" {
  description = "Environment for the instances"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}
