resource "aws_internet_gateway" "k8s_igw" {
  vpc_id = var.vpc_id 

  tags = {
    Name = "k8s-igw"
  }
}
