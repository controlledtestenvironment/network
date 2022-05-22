resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc-${var.environment}"
  }

}

resource "aws_subnet" "sub_vpc" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "subnet-${var.environment}"
  }

}

resource "aws_internet_gateway" "internetGW" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "Internet-gateway-${var.environment}"
  }

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGW.id
  }

  tags = {
    Name = "route-table-${var.environment}"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.sub_vpc.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security" {
  name   = "security-group-terraform"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["200.102.150.151/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group-${var.environment}"
  }

}