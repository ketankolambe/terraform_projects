terraform {
  backend "s3" {
    bucket = "uk9172"
    key    = "Security/kms/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}