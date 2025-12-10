provider "aws" {
  region = "ap-south-1"
}

# ---------------------------
# Launch Template
# ---------------------------
resource "aws_launch_template" "simple" {
  name          = "simple-lt"
  image_id      = var.ami_id
  instance_type = "t2.micro"

  # USER DATA (Ubuntu)
  user_data = base64encode(<<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
echo "<h1>Simple ASG Example</h1>" > /var/www/html/index.html
EOF
  )
}

# ---------------------------
# Auto Scaling Group
# ---------------------------
resource "aws_autoscaling_group" "simple_asg" {
  name                = "simple-asg"
  desired_capacity    = 1
  min_size            = 1
  max_size            = 2
  vpc_zone_identifier = var.subnet_ids   # List of subnets

  health_check_type = "EC2"

  launch_template {
    id      = aws_launch_template.simple.id
    version = "$Latest"
  }
}

