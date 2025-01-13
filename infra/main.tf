provider "aws" {
  region = var.aws_region
  profile = "jaycynth"
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "key_pair" {
  source        = "./modules/key_pair"
  key_pair_name = "k8s_key"
  algorithm     = "RSA"
  rsa_bits      = 4096
}

module "public_subnet" {
  source        = "./modules/subnet"
  vpc_id        = module.vpc.vpc_id
  cidr_block    = var.public_subnet_cidr
  availability_zone = var.availability_zone1
  is_public     = true
}

module "private_subnet" {
  source        = "./modules/subnet"
  vpc_id        = module.vpc.vpc_id
  cidr_block    = var.private_subnet_cidr
  availability_zone = var.availability_zone2
  is_public     = false
}

module "internet_gateway" {
  source          = "./modules/internet_gateway"
  vpc_id          = module.vpc.vpc_id
  route_table_id  = module.public_subnet.route_table_id
}

module "nat_gateway" {
  source               = "./modules/nat_gateway"
  public_subnet_id     = module.public_subnet.subnet_id
  private_route_table_id = module.private_subnet.route_table_id
}

module "security_groups" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "bastion" {
  source         = "./modules/ec2"
  instance_type  = var.bastion_instance_type
  ami            = var.bastion_ami
  subnet_id      = module.public_subnet.subnet_id
  security_group = module.security_groups.bastion_sg_id
  associate_public_ip = true
  count = 1
}

module "master_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.master_instance_type
  ami            = var.master_ami
  subnet_id      = module.private_subnet.subnet_id
  security_group = module.security_groups.allow_all_sg_id
  associate_public_ip = false
  count          = var.master_count
  
}

module "worker_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.worker_instance_type
  ami            = var.worker_ami
  subnet_id      = module.private_subnet.subnet_id
  security_group = module.security_groups.allow_all_sg_id
  associate_public_ip = false
  count          = var.worker_count
}

module "k8s_lb" {
  source = "./modules/load_balancer"

  name                = "k8s-internal-lb"
  is_internal         = true
  security_group_ids  = [module.security_groups.allow_all_sg_id]
  subnet_ids          = [
    module.public_subnet.subnet_id,
    module.private_subnet.subnet_id
  ]
  vpc_id              = module.vpc.vpc_id
  target_group_name   = "k8s-target-group"
  target_group_port   = 6443
  target_group_protocol = "TCP"
  listener_port       = 6443
  listener_protocol   = "TCP"
}

