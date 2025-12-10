variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-02b8269d5e85954ef" # Ubuntu (ap-south-1)
}

variable "subnet_ids" {
  description = "List of subnets for ASG"
  type        = list(string)
}


