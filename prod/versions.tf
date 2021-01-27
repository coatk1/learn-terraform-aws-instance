# This block tells terraform where to download the provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Short for registry.terraform.io/hashicorp/aws
      version = "~> 2.70"       # Recommended
    }
  }
}
