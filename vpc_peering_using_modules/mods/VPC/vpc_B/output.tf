output "vpc_id" {
  value = aws_vpc.vpc_B.id
}

############################
#          Route table
###########################
output "accepter_route_table_id" {
  value = aws_route_table.B_rt.id
}