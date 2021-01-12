# Source: https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started

# This block tells terraform where to download the provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Short for registry.terraform.io/hashicorp/aws
      version = "~> 2.70"       # Recommended
    }
  }
}

# This block configures the provider, AWS.
provider "aws" {
  profile = "default"   # For AWS credentials
  region  = "us-east-1" # Changed from us-west-2
}

# This block defines the infrastructure. First string is resource type, second is resource name.
resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}
