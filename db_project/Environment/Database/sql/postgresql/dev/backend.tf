terraform {
  backend "s3" {
    bucket = "uk9172"
    key    = "terraform/rds/postgresql/test/terraform.tfstate"
    region = "ap-south-1"
  }
}