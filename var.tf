variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = [
    "10.0.1.0/24", # AZ1
    "10.0.2.0/24"  # AZ2
  ]
}

variable "instance_ami" {
  default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
  default = "t3.micro"
}

