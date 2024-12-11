output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "subnet_public_a_id" {
    value = aws_subnet.subnet_public_a.id
}

output "subnet_public_c_id" {
    value = aws_subnet.subnet_public_c.id
}

output "subnet_public_d_id" {
    value = aws_subnet.subnet_public_d.id
}