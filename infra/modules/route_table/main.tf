resource "aws_route_table" "k8s_route_table" {
  vpc_id = var.vpc_id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id 
  }

  tags = {
    Name = "k8s-route-table"
  }
}

resource "aws_route_table_association" "k8s_subnet_association" {
  count          = length(var.subnet_ids)
  
  subnet_id      = var.subnet_ids[count.index]
  
  route_table_id = aws_route_table.k8s_route_table.id 
}
