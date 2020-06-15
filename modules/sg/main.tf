resource "aws_security_group" "Testing-SG" {
  name        = var.sg-name
  description = var.sg-description
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.frport
    to_port     = var.toport
    protocol    = var.protocol
    cidr_blocks = var.sgblock-range
    description = var.ingress-description
  }
}

