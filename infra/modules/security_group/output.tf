output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "allow_all_sg_id" {
  value = aws_security_group.allow_all.id
}
