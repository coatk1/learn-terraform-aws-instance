# Source: https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# Source: https://www.terraform.io/docs/backends/types/s3.html

# This block tells terraform where to download the provider.
terraform {

  # Storing state file in S3 bucket. Must run `terraform init` when making changes.
  backend "s3" {
    encrypt = true
    bucket  = "aws-coatk1-terraform-state"
    key     = "learn-terraform-aws-instance/terraform.tfstate"
    region  = "us-east-1"
  }
}
