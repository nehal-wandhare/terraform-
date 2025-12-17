provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name    = "dev-vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"
}

module "ec2" {
  source = "./modules/ec2"

  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.subnet_id
  instance_name = "dev-ec2"
}

