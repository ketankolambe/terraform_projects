resource "aws_vpc" "vpc_A" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "vpc-A"
  }
}

############################
#          SUBNETS
###########################

resource "aws_subnet" "subnet_A" {
  vpc_id     = aws_vpc.vpc_A.id
  cidr_block = var.A_subnet_cidr_block
  tags = {
    Name = "subnet-A"
  }
}

############################
#          igw
###########################
resource "aws_internet_gateway" "igw_A" {
  vpc_id = aws_vpc.vpc_A.id

  tags = {
    Name = "igw-A"
  }
}

############################
#          route table
###########################
resource "aws_route_table" "A_rt" {
  vpc_id = aws_vpc.vpc_A.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_A.id
  }
  
  tags = {
    Name = "A_rt"
  }
}


resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.subnet_A.id
  route_table_id = aws_route_table.A_rt.id
}

############################
#          EC2
###########################
resource "aws_instance" "public_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_A.id
  associate_public_ip_address = true  
    vpc_security_group_ids = [
    aws_security_group.example.id
  ]
  
  tags = {
    Name = "A_ec2"
  }
}


resource "aws_security_group" "example" {
  name = "example-sg"
  vpc_id = aws_vpc.vpc_A.id

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