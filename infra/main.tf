provider "aws" {
  region = var.aws_region
  profile = "jaycynth"
}


module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "internet_gateway" {
  source          = "./modules/internet_gateway"
  vpc_id          = module.vpc.vpc_id
  public_subnet_id       = module.public_subnet.subnet_id
  private_subnet_id = module.private_subnet.subnet_id
  igw_name        = "k8s-igw"
  nat_gateway_id = module.nat_gateway.nat_gateway_id
}

module "public_subnet" {
  source        = "./modules/subnet"
  vpc_id        = module.vpc.vpc_id
  cidr_block    = var.public_subnet_cidr
  availability_zone = var.availability_zone1
  public_ip_on_launch = true
}

module "private_subnet" {
  source        = "./modules/subnet"
  vpc_id        = module.vpc.vpc_id
  cidr_block    = var.private_subnet_cidr
  availability_zone = var.availability_zone2
}


module "security_groups" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "key_pair" {
  source        = "./modules/key_pair"
  key_pair_name = "k8s_key"
  algorithm     = "RSA"
  rsa_bits      = 4096
}

module "nat_gateway" {
  source               = "./modules/nat_gateway"
  name                 = "k8s-nat-gateway"
  
  public_subnet_id     = module.public_subnet.subnet_id
  private_route_table_id = module.internet_gateway.route_table_id

}

module "bastion" {
  source         = "./modules/ec2"
  instance_type  = var.bastion_instance_type
  ami            = var.bastion_ami
  subnet_id      = module.public_subnet.subnet_id
  security_group = module.security_groups.bastion_sg_id
  count = var.bastion_count
  associate_public_ip_address = true
  key_pair_name = module.key_pair.key_pair_name

}

module "master_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.master_instance_type
  ami            = var.master_ami
  subnet_id      = module.private_subnet.subnet_id
  security_group = module.security_groups.allow_all_sg_id
  count          = var.master_count
    key_pair_name = module.key_pair.key_pair_name
  associate_public_ip_address = false

}

module "worker_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.worker_instance_type
  ami            = var.worker_ami
  subnet_id      = module.private_subnet.subnet_id
  security_group = module.security_groups.allow_all_sg_id
  count          = var.worker_count
    key_pair_name = module.key_pair.key_pair_name
  associate_public_ip_address = false

}

module "k8s_lb" {
  source       = "./modules/load_balancer"
  subnet_ids = [
    module.public_subnet.subnet_id,
  
  ]

  security_group_ids = [
    module.security_groups.allow_all_sg_id 
  ]
}
