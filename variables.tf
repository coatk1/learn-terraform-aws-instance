# Root Module Variables
# To define a variable set default variable or .tfvars.
# Input variables. See available_zones.auto.tfvars.
# Source: https://www.terraform.io/docs/language/values/variables.html

# Defines the variable region in configuration.
variable "region" {
  # default = "us-east-1"
  type        = string
  description = "This variable sets the instance region."
}

variable "amis" {
  type        = map(string)
  description = "This variable sets the AMI image to the region."
}

# variable "vpc" {
#     type        = list(string)
#     description = "This variable sets the vpc."
# }

# variable "subnet" {
#     type        = string
#     description = "This variable sets the subnet."
# }
