output "vpc_id" {
  value = module.vpc_A.vpc_id
}

output "B_vpc_id" {
  value = module.vpc_B.vpc_id
}

output "vpc_cidr" {
  value = module.vpc_A.vpc_cidr
}

############################
#          SUBNETS
###########################
output "A_subnet_id" {
  value = module.vpc_A.A_subnet_cidr_block
}

output "A_subnet_cidr_block" {
  value = module.vpc_A.A_subnet_cidr_block
}