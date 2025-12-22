resource "aws_vpc" "codepanda_iac_vpc" {
  cidr_block = "172.0.0.0/16"
  tags = {
    Name = "codepanda_iac_vpc"
    env = "dev"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.codepanda_iac_vpc.id
  cidr_block        = "172.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "codepanda_public_subnet_1"
    env = "dev"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.codepanda_iac_vpc.id
  cidr_block        = "172.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "codepanda_public_subnet_2"
    env = "dev"
  }
}

resource "aws_internet_gateway" "codepanda_igw" {
  vpc_id = aws_vpc.codepanda_iac_vpc.id
  tags = {
    Name = "codepanda_igw"
    env = "dev"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.codepanda_iac_vpc.id
  tags = {
    Name = "codepanda_public_rt"
    env = "dev"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.codepanda_igw.id
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}