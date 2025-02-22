resource "aws_launch_template" "this" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        Name = var.name
      }
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}