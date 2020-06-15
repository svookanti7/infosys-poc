provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  assume_role {
    role_arn = "arn:aws:iam::698410828385:user/infosys-poc"
  }
}

terraform {
  backend "s3" {
    bucket = "infosys-poc"
    key    = "infosys/poc.tfstate"
    region = "eu-west-2"
  }
}

module "my_vpc" {
  source      = "./modules/vpc"
  block-range = var.block-range
  tenancy     = var.tenancy
  vpc         = var.vpc
}

module "aws_subnet" {
  source     = "./modules/subnet"
  vpc_id     = module.my_vpc.vpc_id
  block-range = var.block-range
  subnet     = var.subnet
}

module "my_sg" {
  source              = "./modules/sg"
  sg-name             = var.sg-name
  sg-description      = var.sg-description
  vpc_id              = module.my_vpc.vpc_id
  frport              = var.frport
  toport              = var.toport
  protocol            = var.protocol
  sgblock-range       = var.sgblock-range
  ingress-description = var.ingress-description
}

module "my_lc" {
  source  = "./modules/lc"
  lcname  = var.lcname
  imageid = var.imageid
  type    = var.type
  sg_id   = module.my_sg.sg_id
}

module "my_autoscaling_grp" {
  source           = "./modules/asg"
  asggroup         = var.asggroup
  Testing-launch   = module.my_lc.lcname
  Test-subnet      = module.aws_subnet.subnet_id
  desired_capacity = var.desired_capacity
  min              = var.min
  max              = var.max
}

module "my_autoscaling_scheduler_up" {
  source                = "./modules/ashup"
  scheduled_action_name = "poc_scheduler_up"
  min_up                = 1
  max_up                = 10
  desired_up            = 1
  recurrence_up         = "00 09 * * MON-FRI"
  asg_group_name        = module.my_autoscaling_grp.asg_group
}

module "my_autoscaling_scheduler_down" {
  source                = "./modules/ashdown"
  scheduled_action_name = "poc_scheduler_down"
  min_down              = 0
  max_down              = 0
  desired_down          = 0
  recurrence_down       = "00 18 * * MON-FRI"
  asg_group_name        = module.my_autoscaling_grp.asg_group
}
