terraform {
  backend "s3" {
    bucket = "uk9172"
    key    = "terraform/dynamodb/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}