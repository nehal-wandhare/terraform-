variable "name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "target_group_arn" {}

