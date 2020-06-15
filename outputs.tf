output "asg_group" {
  value= module.my_autoscaling_grp.asg_group
 }
 
output "asg_scheduler_down" {
  value= module.my_autoscaling_scheduler_down.asg_scheduler_down
 }
 
 output "asg_scheduler_up" {
  value= module.my_autoscaling_scheduler_up.asg_scheduler_up
 }
output "lcname" {
  value= module.my_lc.lcname
 }
 output "sg_id" {
  value= module.my_sg.sg_id
 }
 output "subnet_id" {
  value= module.aws_subnet.subnet_id
 }
 output "vpc_id" {
  value= module.my_vpc.vpc_id
 }