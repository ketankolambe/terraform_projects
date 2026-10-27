terraform {
  backend "s3" {
    bucket = "terraform-bucket-backend-new"
    key    = "ec2/schedular/terraform.tfstate"
    region = "ap-south-1"
  }
}