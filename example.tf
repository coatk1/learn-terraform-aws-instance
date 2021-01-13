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
  # backend "s3" {
  #   bucket = "aws-coatk1-terraform-state"
  #   key    = "path/to/my/key"
  #   region = "us-east-1"
  # }
}

# This block configures the provider, AWS.
provider "aws" {
  profile = "default"   # For AWS credentials
  region  = "us-east-1" # Changed from us-west-2
}

# This block defines the infrastructure. First string is resource type, second is resource name.
resource "aws_instance" "example" {
  ami                    = "ami-03ff55e13c2ca241e"  # Changed from ami-830c94e3. Using us-east-1 region.
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-04638424"]          # Not needed, this is default VPC but specified for practice.
  subnet_id              = "subnet-8da367ac"        # Not needed, this is default VPC but specified for practice.

  tags = {
    Name = "terraform-aws-ec2"
  }
}
