variable "B_cidr_block" {
  type = string
}

variable "B_instance_tenancy" {
  type = string
}

############################
#          SUBNETS
###########################
variable "B_subnet_cidr_block" {
  type = string
}


############################
#          EC2
###########################
variable "b_ami_id" {
  type = string
}

variable "b_instance_type" {
  type = string
}
