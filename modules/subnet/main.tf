
resource "aws_subnet" "Test-subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.block-range

  tags = {
    Name = "var.subnet"
  }
}

