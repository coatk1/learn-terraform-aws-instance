# This block configures the provider, AWS.
provider "aws" {
  profile = "default"      # For AWS credentials
  region  = var.aws_region # Using variables
}

# Create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform_state_storage_s3_prod" {
  bucket = "aws-coatk1-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false # Set to false for now.
  }

}

terraform {

  # Storing state file in S3 bucket. Must run `terraform init` when making changes.
  backend "s3" {
    encrypt = true
    bucket  = "aws-coatk1-terraform-state"
    key     = "learn-terraform-aws-instance/prod/terraform.tfstate"
    region  = "us-east-1"
  }
}

# This block defines the infrastructure. First string is resource type, second is resource name.
resource "aws_instance" "terraform_ec2" {
  ami                    = var.amis[var.aws_region]
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc    # Not needed, this is default VPC but specified for practice.
  subnet_id              = var.subnet # Not needed, this is default VPC but specified for practice.

  tags = {
    Name = "${var.ec2}-${var.prod_prefix}"
  }
}

# This block defines the elastic IP address.
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.terraform_ec2.id
}
