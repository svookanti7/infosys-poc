resource "aws_autoscaling_group" "testing-autosacling-group" {
  name                 = var.asggroup
  launch_configuration = var.Testing-launch
  vpc_zone_identifier  = [var.Test-subnet]
  desired_capacity     = var.desired_capacity
  min_size             = var.min
  max_size             = var.max

  lifecycle {
    create_before_destroy = true
  }
}

