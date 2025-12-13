provider "aws" {
  region = var.region
}

# --- ALB MODULE ---
module "alb" {
  source            = "./modules/alb"
  name              = "my-alb"
  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
}

# --- ASG MODULE ---
module "asg" {
  source              = "./modules/asg"
  name                = "my-asg"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  vpc_id              = var.vpc_id
  public_subnet_ids   = var.public_subnet_ids
  target_group_arn    = module.alb.target_group_arn
}

