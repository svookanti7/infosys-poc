resource "aws_autoscaling_schedule" "app_scheduler_down" {
  scheduled_action_name  = var.scheduled_action_name
  min_size               = var.min_down
  max_size               = var.max_down
  desired_capacity       = var.desired_down
  recurrence             = var.recurrence_down
  autoscaling_group_name = var.asg_group_name
}
