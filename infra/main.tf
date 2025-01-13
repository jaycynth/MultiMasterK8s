provider "aws" {
  region = var.aws_region
  profile = "jaycynth"
}


module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}


module "networking" {
  source              = "./modules/networking"
  vpc_id              = module.vpc.vpc_id
  igw_name            = "k8s-internet-gateway"
  subnet_name_prefix  = "k8s"
  public_subnet_ids   = module.public_subnet.subnet_ids
  private_subnet_ids  = module.private_subnet.subnet_ids
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
}


module "public_subnet" {
  source              = "./modules/public_subnet"
  vpc_id              = module.vpc.vpc_id
  cidr_blocks         = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  subnet_name_prefix  = "k8s"
}

module "private_subnet" {
  source              = "./modules/private_subnet"
  vpc_id              = module.vpc.vpc_id
  cidr_blocks         = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
  subnet_name_prefix  = "k8s"
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
  public_subnet_id     = module.public_subnet.subnet_ids
  private_route_table_id = module.networking.private_route_table_id

}

module "bastion" {
  source         = "./modules/ec2"
  instance_type  = var.bastion_instance_type
  ami            = var.bastion_ami
  subnet_id      = module.public_subnet.subnet_ids
  security_group = module.security_groups.bastion_sg_id
  count = var.bastion_count
  associate_public_ip_address = true
  key_pair_name = module.key_pair.key_pair_name

}



module "master_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.master_instance_type
  ami            = var.master_ami
  subnet_id      = module.private_subnet.subnet_ids
  security_group = module.security_groups.allow_all_sg_id
  count          = var.master_count
  key_pair_name = module.key_pair.key_pair_name
  associate_public_ip_address = false
}


module "worker_nodes" {
  source         = "./modules/ec2"
  instance_type  = var.worker_instance_type
  ami            = var.worker_ami
  subnet_id      = module.private_subnet.subnet_ids
  security_group = module.security_groups.allow_all_sg_id
  count          = var.worker_count
    key_pair_name = module.key_pair.key_pair_name
  associate_public_ip_address = false

}

module "internal_lb" {
  source              = "./modules/load_balancer"
  lb_name             = "k8s-internal-lb"
  security_group_ids  = [module.security_groups.allow_all_sg_id]
  subnet_ids          = module.private_subnet.subnet_ids
  vpc_id              = module.vpc.vpc_id
  target_group_name   = "k8s-api-target-group"
  health_check_path   = "/healthz"
  target_ids          = [for instance in module.master_nodes : instance.id]
}
