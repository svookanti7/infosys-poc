resource "aws_launch_configuration" "Testing-launch" {
  name_prefix     = var.lcname
  image_id        = var.imageid
  instance_type   = var.type
  security_groups = [var.sg_id]
  lifecycle {
    create_before_destroy = true
  }
}

