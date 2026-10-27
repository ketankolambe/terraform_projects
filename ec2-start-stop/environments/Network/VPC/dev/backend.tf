terraform {
  backend "s3" {
    bucket = "terraform-bucket-backend-new"
    key    = "dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}