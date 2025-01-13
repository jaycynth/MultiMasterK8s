resource "aws_subnet" "private" {
  count                   = length(var.cidr_blocks)
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.subnet_name_prefix}-private-${count.index}"
  }
}
