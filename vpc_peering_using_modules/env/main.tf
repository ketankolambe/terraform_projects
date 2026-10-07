module "vpc_A" {
  source = "../mods/VPC/vpc_A"

  providers = {
    aws = aws.A
  }

  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  A_subnet_cidr_block = var.A_subnet_cidr_block
############################
#          EC2
###########################
  ami_id = var.ami_id
  instance_type = var.instance_type
}



module "vpc_B" {
  source = "../mods/VPC/vpc_B"

  providers = {
    aws = aws.B
  }

  B_cidr_block = var.B_cidr_block
  B_instance_tenancy = var.B_instance_tenancy
  B_subnet_cidr_block = var.B_subnet_cidr_block
############################
#          EC2
###########################
  b_ami_id = var.b_ami_id
  b_instance_type = var.b_instance_type
}

resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id   = module.vpc_B.vpc_id
  vpc_id        = module.vpc_A.vpc_id
  peer_region = "us-west-1"
  auto_accept   = false

  tags = {
    Name = "VPC Peering between A and B"
  }
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  region                    = "us-west-1"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

resource "aws_route" "requester_to_accepter" {
  provider = aws.A

  route_table_id            = module.vpc_A.requester_route_table_id
  destination_cidr_block    = "20.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id

  depends_on = [
    aws_vpc_peering_connection_accepter.peer
  ]
}

resource "aws_route" "accepter_to_requester" {
  provider = aws.B

  route_table_id            = module.vpc_B.accepter_route_table_id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id

  depends_on = [
    aws_vpc_peering_connection_accepter.peer
  ]
}