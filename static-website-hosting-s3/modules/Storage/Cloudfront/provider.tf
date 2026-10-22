
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type = string
}

variable "aws_s3_bucket_versioning" {
  type = string
}

variable "aws_s3_bucket_acl" {
  type = string
}