variable "region" {
  default = "ap-south-1"
}

variable "vpc_id" {}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ami_id" {
  default = "ami-02b8269d5e85954ef" #  ubuntu example
}

variable "instance_type" {
  default = "t3.micro"
}

