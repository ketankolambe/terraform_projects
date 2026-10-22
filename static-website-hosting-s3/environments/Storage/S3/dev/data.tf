#######################################################
# Route53 Hosted Zone
#######################################################

#################################################
# DNS REMOTE STATE
#################################################

data "terraform_remote_state" "dns" {

  backend = "s3"

  config = {

   bucket = "terraform-bucket-backend-new"
    key    = "terraform/stat-web-host-s3/dns/terraform.tfstate"
    region = "ap-south-1"
  
  }
}

#######################################################
# ACM Remote State
#######################################################

data "terraform_remote_state" "acm_global" {

  backend = "s3"

  config = {

    bucket = "terraform-bucket-backend-new"
    key    = "terraform/stat-web-host-s3/security/terraform.tfstate"
    region = "ap-south-1"

  }

}