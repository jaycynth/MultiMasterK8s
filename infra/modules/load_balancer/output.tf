output "lb_dns_name" {
  value = aws_lb.k8s_lb.dns_name
}

output "lb_arn" {
  value = aws_lb.k8s_lb.arn
}

