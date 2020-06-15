variable "vpc_id" {
  description = "The customer VPC name."
}  
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

