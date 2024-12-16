############ VPC #########
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet_publics" {
  vpc_id            = aws_vpc.demo_vpc.id
  count = length(data.aws_availability_zones.available.names)
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name = "${var.vpc_name}-${element(data.aws_availability_zones.available.names, count.index)}-ps"
  }
}
