output "lb_arn" {
  value = aws_lb.internal_lb.arn
}

output "lb_dns_name" {
  value = aws_lb.internal_lb.dns_name
}
