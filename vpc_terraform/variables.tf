variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "172.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "172.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "172.0.2.0/24"
}

variable "public_az" {
  default = "ap-south-1a"
}

variable "private_az" {
  default = "ap-south-1b"
}

