# This block configures the provider, AWS with the region.
provider "aws" {
  profile = "default"      # For AWS credentials
  region  = var.aws_region # Using variables
}

#############
# Creates VPC
#############

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
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

#############
# Creates EC2
#############

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

#############
# Creates S3
#############

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

#############
# Creates RDS
#############

# module "rds" {
#   source  = "terraform-aws-modules/rds/aws"
#   version = "~> 2.0"

#   # insert the 11 required variables here
#   identifier = "demodb-postgres"

#   engine            = "postgres"
#   engine_version    = "9.6.9"
#   instance_class    = "db.t3.micro"
#   allocated_storage = 5
#   storage_encrypted = false

#   # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
#   name = "demodb"

#   # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
#   # "Error creating DB Instance: InvalidParameterValue: MasterUsername
#   # user cannot be used as it is a reserved word used by the engine"
#   username = var.name

#   password = var.pwd
#   port     = "5432"

#   vpc_security_group_ids = [data.aws_security_group.default.id]

#   maintenance_window = "Mon:00:00-Mon:03:00"
#   backup_window      = "03:00-06:00"

#   # disable backups to create DB faster
#   backup_retention_period = 0

#   tags = {
#     Owner       = "user"
#     Environment = "dev"
#   }

#   enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

#   # DB subnet group
#   subnet_ids = data.aws_subnet_ids.all.ids

#   # DB parameter group
#   family = "postgres9.6"

#   # DB option group
#   major_engine_version = "9.6"

#   # Snapshot name upon DB deletion
#   final_snapshot_identifier = "demodb"

#   # Database Deletion Protection
#   deletion_protection = false
# }
