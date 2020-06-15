variable "bucket" {
  description = "To store terraform tfstate files"
}

variable "region" {
  description = "AWS region code"
}
variable "access_key" {
  description = "access key of user"
}
variable "secret_key" {
  description = "secret key of user"
}
variable "vpc" {
  description = "The customer VPC name."
} 
variable "subnet" {
  description = "The name of subnet"
}   
variable "block-range"{}
variable "tenancy"{}

variable "sg-name"{}
variable "sg-description"{}
variable "frport"{} 
variable "toport"{}
variable "protocol"{}
variable "sgblock-range" {
  type        = list(string)
  default     = []
}
variable "ingress-description"{}
variable "lcname"{}
variable "imageid"{}
variable "type"{}
variable "asggroup"{}
variable "min"{}
variable "desired_capacity"{}
variable "max"{}
