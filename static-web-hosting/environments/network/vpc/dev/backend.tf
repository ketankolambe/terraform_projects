terraform {
  backend "s3" {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/static-web-hosting/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
