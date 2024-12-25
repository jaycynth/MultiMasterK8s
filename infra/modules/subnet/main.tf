resource "aws_subnet" "k8s_subnet" {
  count                   = var.subnet_count 
  vpc_id                  = var.vpc_id 
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  
  map_public_ip_on_launch = true

  tags = {
    Name = "k8s-subnet-${count.index}"
  }
}
