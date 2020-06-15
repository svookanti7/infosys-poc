
variable "vpc_id" {
  description = "The customer VPC name"  
}  

variable "block-range" {
 default = "172.31.0.0/16"
}
variable "subnet"{
  default="test-subnet"
}

