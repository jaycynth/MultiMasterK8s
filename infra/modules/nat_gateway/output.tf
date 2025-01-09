output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "eip_id" {
  description = "The Elastic IP ID associated with the NAT Gateway"
  value       = aws_eip.nat.id
}
