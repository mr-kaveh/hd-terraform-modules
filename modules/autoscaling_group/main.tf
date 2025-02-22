resource "aws_autoscaling_group" "this" {
  name_prefix          = var.name_prefix
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.vpc_zone_identifier
  health_check_type    = var.health_check_type
  target_group_arns    = var.target_group_arns

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}