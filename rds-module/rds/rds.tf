############################
# RDS SUBNET GROUP
############################
resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

############################
# RDS INSTANCE
############################
resource "aws_db_instance" "this" {
  identifier        = var.db_name
  db_name           = var.db_name

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.allocated_storage

  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_ids

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = var.db_name
  }
}

############################
# VARIABLES
############################
variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "DB master username"
}

variable "db_password" {
  description = "DB password"
  sensitive   = true
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "8.0"
}

variable "allocated_storage" {
  default = 20
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}

############################
# OUTPUTS
############################
output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_id" {
  value = aws_db_instance.this.id
}
