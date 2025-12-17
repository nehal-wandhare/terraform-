variable "ami" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "subnet_id" {}
variable "instance_name" {
  default = "my-ec2"
}
