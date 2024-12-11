# provider "aws" {
#   profile = "long"
#   region = "ap-northeast-1"
# }

############ VPC #########
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

# Subnet ap-northeast-1a
resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.vpc_name}-public-a-subnet"
  }
}

# Subnet ap-northeast-1c
resource "aws_subnet" "subnet_public_c" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.vpc_name}-public-c-subnet"
  }
}


# Subnet ap-northeast-1d
resource "aws_subnet" "subnet_public_d" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "${var.vpc_name}-public-d-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}



# Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Association Public 
resource "aws_route_table_association" "a_public" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "d_public" {
  subnet_id      = aws_subnet.subnet_public_d.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "c_public" {
  subnet_id      = aws_subnet.subnet_public_c.id
  route_table_id = aws_route_table.public_route_table.id
}

