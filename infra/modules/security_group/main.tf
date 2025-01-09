resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound and outbound traffic"
  vpc_id  = var.vpc_id



}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  vpc_id = var.vpc_id
  description = "Allow SSH access to bastion host"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

