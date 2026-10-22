data "terraform_remote_state" "launch_template_backend" {
  backend = "s3"

  config = {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/lt/terraform.tfstate"
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


###################################################
#######   dns backend 
###################################################

data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {

    bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/dns/terraform.tfstate"
    region = "ap-south-1"

  }
}


###################################################
#######    alb backend 
###################################################

data "terraform_remote_state" "alb_backend" {
  backend = "s3"

  config = {

   bucket = "uk9172" # this must be your s3 bucket name
    key    = "terraform/alb/terraform.tfstate"
    region = "ap-south-1"

  }
}