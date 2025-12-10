provider "aws" {
  region = var.region
}

resource "aws_security_group" "web_sg" {
  name        = var.sg_name
  description = "Security group for web access"
  vpc_id      = var.vpc_id

  # Ingress Rule - Allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  # Egress Rule - Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

