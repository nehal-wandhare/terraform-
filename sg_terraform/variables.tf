variable "region" {
  default = "ap-south-1"
}

variable "sg_name" {
  description = "Name of Security Group"
  default     = "my-web-sg"
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "allowed_cidrs" {
  description = "CIDRs allowed for ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

