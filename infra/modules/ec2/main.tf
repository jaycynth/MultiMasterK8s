resource "aws_instance" "instance" {
  ami              = var.ami
  instance_type    = var.instance_type
  subnet_id        = var.subnet_id
  security_groups  = [var.security_group]
  count            = var.instance_count
  key_name      = var.key_pair_name
  associate_public_ip_address = var.associate_public_ip
  
}
