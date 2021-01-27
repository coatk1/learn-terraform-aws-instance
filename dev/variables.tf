# Root Module Variables
# To define a variable set default variable or .tfvars.
# Input variables. See available_zones.auto.tfvars.

# Defines the variable region in configuration.
variable "aws_region" {
  description = "This variable sets the instance region."
  type        = string
  default     = "us-east-1" # Changed from us-west-2. This is assigned unless set `terraform apply -var region=us-west-2`
}

variable "amis" {
  description = "This variable sets the AMI image to the region."
  type        = map(string)
  default = {
    "us-east-1" = "ami-03ff55e13c2ca241e"
    "us-west-2" = "ami-830c94e3"
  }
}

variable "dev_prefix" {
  description = "This is the environment for development."
  type        = string
  default     = "dev"
}

variable "ec2" {
  description = "This is the tag for ec2."
  type        = string
  default     = "terraform-aws-ec2"
}

variable "vpc_name" {
  description = "This variable sets the vpc."
  type        = list(string)
  default     = ["sg-04638424"]
  # default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(any)
  default     = ["us-east-1a"]
}

variable "subnet" {
  description = "This variable sets the subnet."
  type        = string
  default     = "subnet-8da367ac"
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = [""]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = [""]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
