# Root Module Variables
# To define a variable set default variable or .tfvars.
# Input variables. See available_zones.auto.tfvars.

# Defines the variable region in configuration.
variable "aws_region" {
  description = "This variable sets the instance region."
  default     = "us-east-1" # Changed from us-west-2. This is assigned unless set `terraform apply -var region=us-west-2`
}

variable "amis" {
  description = "This variable sets the AMI image to the region."
  default = {
    "us-east-1" = "ami-03ff55e13c2ca241e"
    "us-west-2" = "ami-830c94e3"
  }
}

variable "prod_prefix" {
  description = "This is the environment for production."
  default     = "prod"
}

variable "ec2" {
  description = "This is the tag for ec2."
  default     = "terraform-aws-ec2"
}

variable "vpc" {
  description = "This variable sets the vpc."
  default     = ["sg-04638424"]
}

variable "subnet" {
  description = "This variable sets the subnet."
  default     = "subnet-8da367ac"
}
