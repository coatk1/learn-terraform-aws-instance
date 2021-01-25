# Source: https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# Source: https://www.terraform.io/docs/backends/types/s3.html

# This block tells terraform where to download the provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Short for registry.terraform.io/hashicorp/aws
      version = "~> 2.70"       # Recommended
    }
  }

  # Storing state file in S3 bucket. Must run `terraform init` when making changes.
  # backend "s3" {
  #   encrypt = true
  #   bucket  = "aws-coatk1-terraform-state"
  #   key     = "learn-terraform-aws-instance/terraform.tfstate"
  #   region  = "us-east-1"
  # }
}

# This block configures the provider, AWS.
provider "aws" {
  profile = "default"  # For AWS credentials
  region  = var.region # Using variables
  # region  = "us-east-1" # Changed from us-west-2
}

# Create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "aws-coatk1-terraform-state"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = false  # Set to false for now.
    }

    # tags = {
    #   Name = "dummy"
    # }
}

# This block defines the infrastructure. First string is resource type, second is resource name.
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  # vpc_security_group_ids = var.vpc     # Not needed, this is default VPC but specified for practice.
  # subnet_id              = var.subnet  # Not needed, this is default VPC but specified for practice.

  tags = {
    Name = "terraform-aws-ec2"
  }
}

# This block defines the elastic IP address.
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

# Displays output.
output "ami" {
  value = aws_instance.example.ami
}

output "ip" {
  value = aws_eip.ip.public_ip
}
