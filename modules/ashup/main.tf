resource "aws_autoscaling_schedule" "app_scheduler_up" {
  scheduled_action_name  = var.scheduled_action_name
  min_size               = var.min_up
  max_size               = var.max_up
  desired_capacity       = var.desired_up
  recurrence             = var.recurrence_up
  autoscaling_group_name = var.asg_group_name
}
