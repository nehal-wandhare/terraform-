variable "vpc_id" {
  description = "ID of the VPC"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

