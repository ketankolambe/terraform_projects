data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {


    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/dns/terraform.tfstate"
    region = "ap-south-1"

  }
}
