data "terraform_remote_state" "acm_backend" {
  backend = "s3"

  config = {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/acm-alb/terraform.tfstate"
    region = "ap-south-1"

  }
}

######################################################
#### vpc_backend
#####################################################

data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/vpc/terraform.tfstate"
    region = "ap-south-1"

  }
}


###################################################
#######   acm alb backend 
###################################################

data "terraform_remote_state" "tg_backend" {
  backend = "s3"

  config = {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/tg/terraform.tfstate"
    region = "ap-south-1"

  }
}
