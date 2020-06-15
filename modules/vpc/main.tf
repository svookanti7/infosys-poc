
resource "aws_vpc" "test-vpc" {

  cidr_block       = var.block-range
  instance_tenancy = var.tenancy

  tags = {
    Name = var.vpc
  }
}

