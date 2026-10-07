variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

############################
#          SUBNETS
###########################
variable "A_subnet_cidr_block" {
  type = string
}


############################
#          EC2
###########################
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}
