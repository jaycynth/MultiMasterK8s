resource "aws_security_group" "k8s_sg" {
  vpc_id = var.vpc_id 

 ingress {
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
     from_port   = 6443 
     to_port     = 6443 
     protocol    ="tcp"
     cidr_blocks=["0.0.0.0/0"]
 }

 ingress { 
     from_port=2379 
     to_port=2380 
     protocol="tcp"
     cidr_blocks=["0.0.0.0/0"]
 }

 ingress { 
     from_port=10250 
     to_port=10252 
     protocol="tcp"
     cidr_blocks=["0.0.0.0/0"]
 }

 egress { 
     from_port=0 
     to_port=0 
     protocol="-1"
     cidr_blocks=["0.0.0.0/0"]
 }

 tags={
     Name="k8s-security-group"
 }
}
