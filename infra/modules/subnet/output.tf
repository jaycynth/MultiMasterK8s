output "subnet_ids" {
  value = aws_subnet.k8s_subnet[*].id 
}
