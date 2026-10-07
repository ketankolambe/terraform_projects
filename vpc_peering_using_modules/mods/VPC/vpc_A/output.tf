output "vpc_id" {
  value = aws_vpc.vpc_A.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc_A.cidr_block
}

############################
#          SUBNETS
###########################
output "A_subnet_id" {
  value = aws_subnet.subnet_A.id
}

output "A_subnet_cidr_block" {
  value = aws_subnet.subnet_A.cidr_block
}

############################
#          Route table
###########################
output "requester_route_table_id" {
  value = aws_route_table.A_rt.id
}