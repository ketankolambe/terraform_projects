data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "terraform-bucket-backend-new"
    key    = "Network/dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}