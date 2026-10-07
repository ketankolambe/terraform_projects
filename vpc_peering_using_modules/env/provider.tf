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
  alias  = "A"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "B"
  region = "us-west-1"
}