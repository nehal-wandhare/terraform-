provider "aws" {
  region = "ap-south-1"
}

# ----------------------------
# Security Group for ALB
# ----------------------------
resource "aws_security_group" "alb_sg" {
  name   = "simple-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ----------------------------
# Application Load Balancer
# ----------------------------
resource "aws_lb" "simple_alb" {
  name               = "simple-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnets
}

# ----------------------------
# Target Group
# ----------------------------
resource "aws_lb_target_group" "simple_tg" {
  name     = "simple-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 2
  }
}

# ----------------------------
# ALB Listener
# ----------------------------
resource "aws_lb_listener" "simple_listener" {
  load_balancer_arn = aws_lb.simple_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.simple_tg.arn
  }
}

