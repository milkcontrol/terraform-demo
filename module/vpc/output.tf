output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "subnet_publics" {
    value = aws_subnet.subnet_publics
}