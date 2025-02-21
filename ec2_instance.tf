# Main 🦁
module "ec2_instances" {
  source          = "./modules/ec2_instance"
  ami             = var.ami
  instance_type   = var.instance_type
  instance_prefix = var.instance_prefix
  environment     = var.environment
  instance_count  = var.instance_count
}

# Outputs 🐵
output "instance_ids" {
  value = module.ec2_instances.instance_ids
}

# Variables 🦊
variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "Type of the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "instance_prefix" {
  description = "Prefix for the instance names"
  type        = string
  default     = "example-instance"
}

variable "environment" {
  description = "Environment for the instances"
  type        = string
  default     = "dev"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 3
}