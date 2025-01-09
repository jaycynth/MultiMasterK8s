# Outputs
output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "route_table_association_id" {
  value = aws_route_table_association.public_subnet_assoc.id
}
