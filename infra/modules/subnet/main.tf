resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.is_public

  tags = {
    Name = var.name
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.name}-route-table"
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

