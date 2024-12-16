output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

# output "azs" {
#   value = data.aws_availability_zones.available.names
# }




output "subnet_public_ids" {
    value = [aws_subnet.subnet_public[*].id]
}