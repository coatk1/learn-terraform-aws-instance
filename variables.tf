# Root Module Variables
# Input variables. See available_zones.auto.tfvars.

# This is required if not using a default variable. This defines the variable "region" in configuration.
variable "region" {
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
