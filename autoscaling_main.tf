module "launch_template" {
  source        = "./modules/launch_template"
  name_prefix   = "web-template-"
  image_id      = "ami-0c55b159cbfafe1f0" # Replace with your AMI ID
  instance_type = "t2.micro"
  name          = "web-server"
  tags          = { Environment = "production" }
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  name                = "web-lb"
  internal            = false
  security_groups     = ["sg-abc123"] # Replace with your security group ID
  subnets             = ["subnet-abc123", "subnet-def456"] # Replace with your subnet IDs
  target_group_name   = "web-tg"
  target_group_port   = 80
  target_group_protocol = "HTTP"
  vpc_id             = "vpc-abc123" # Replace with your VPC ID
  listener_port      = 80
  listener_protocol  = "HTTP"
}

module "autoscaling_group" {
  source              = "./modules/autoscaling_group"
  name_prefix         = "web-asg-"
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  vpc_zone_identifier = ["subnet-abc123", "subnet-def456"] # Replace with your subnet IDs
  health_check_type   = "ELB"
  target_group_arns   = [module.load_balancer.target_group_arn]
  launch_template_id  = module.launch_template.launch_template_id
}