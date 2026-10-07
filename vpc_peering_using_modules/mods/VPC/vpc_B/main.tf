resource "aws_vpc" "vpc_B" {
  cidr_block       = var.B_cidr_block
  instance_tenancy = var.B_instance_tenancy

  tags = {
    Name = "vpc-B"
  }
}

############################
#          SUBNETS
############################

resource "aws_subnet" "subnet_B" {
  vpc_id     = aws_vpc.vpc_B.id
  cidr_block = var.B_subnet_cidr_block
  tags = {
    Name = "subnet-B"
  }
}

############################
#          igw
###########################
resource "aws_internet_gateway" "igw_B" {
  vpc_id = aws_vpc.vpc_B.id

  tags = {
    Name = "igw-B"
  }
}

############################
#          route table
###########################
resource "aws_route_table" "B_rt" {
  vpc_id = aws_vpc.vpc_B.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_B.id
  }
  
  tags = {
    Name = "B_rt"
  }
}


resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.subnet_B.id
  route_table_id = aws_route_table.B_rt.id
}

############################
#          EC2
###########################
resource "aws_instance" "public_ec2" {
  ami           = var.b_ami_id
  instance_type = var.b_instance_type
  subnet_id = aws_subnet.subnet_B.id
    vpc_security_group_ids = [
    aws_security_group.example.id
  ]
  
  tags = {
    Name = "B_ec2"
  }
}


resource "aws_security_group" "example" {
  name = "example-sg"
  vpc_id = aws_vpc.vpc_B.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  description = "Allow all outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}