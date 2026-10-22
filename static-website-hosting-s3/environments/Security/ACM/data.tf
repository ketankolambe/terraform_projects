data "terraform_remote_state" "dns_backend" {
 backend = "s3"

  config = {
   bucket = "uk9172"
    key    = "terraform/stat-web-host-s3/dns/terraform.tfstate"
    region = "ap-south-1"
}
}