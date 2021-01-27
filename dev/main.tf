# This block configures the provider, AWS with the region.
provider "aws" {
  profile = "default"      # For AWS credentials
  region  = var.aws_region # Using variables
}

# This block creates VPC resources.
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"  # Could also be path to your own custom module.
#   version = "2.21.0"

#   # insert the 8 required variables here
#   name = var.vpc_name
#   cidr = var.vpc_cidr

#   azs             = var.vpc_azs
#   private_subnets = var.vpc_private_subnets
#   public_subnets  = var.vpc_public_subnets

#   enable_nat_gateway = var.vpc_enable_nat_gateway

#   tags = var.vpc_tags
# }

# This block defines the ec2 instances.
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "${var.ec2}-${var.dev_prefix}"
  instance_count = 2

  ami                    = var.amis[var.aws_region]
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc_name
  subnet_id              = var.subnet
  # vpc_security_group_ids = [module.vpc.default_security_group_id]
  # subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# Create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform_state_storage_s3_dev" {
  bucket = "aws-coatk1-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false # Set to false for now.
  }

  tags = {
    Name = var.dev_prefix
  }
}

terraform {

  # Storing state file in S3 bucket. Must run `terraform init` when making changes.
  backend "s3" {
    encrypt = true
    bucket  = "aws-coatk1-terraform-state"
    key     = "learn-terraform-aws-instance/dev/terraform.tfstate"
    region  = "us-east-1"
  }
}

# # This block defines the infrastructure. First string is resource type, second is resource name.
# resource "aws_instance" "terraform_ec2" {
#   ami                    = var.amis[var.aws_region]
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = var.vpc_name     # Not needed, this is default VPC but specified for practice.
#   subnet_id              = var.subnet  # Not needed, this is default VPC but specified for practice.

#   tags = {
#     Name = "${var.ec2}-${var.dev_prefix}-test"
#   }
# }

# # This block defines the elastic IP address.
# resource "aws_eip" "ip" {
#   vpc      = true
#   instance = aws_instance.terraform_ec2.id
# }
