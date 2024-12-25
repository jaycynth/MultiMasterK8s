provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source      = "./modules/subnet"
  vpc_id     = module.vpc.vpc_id
  subnet_count = var.subnet_count 
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source      = "./modules/route_table"
  vpc_id     = module.vpc.vpc_id
  igw_id      = module.internet_gateway.igw_id
  subnet_ids  = module.subnets.subnet_ids
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source           = "./modules/ec2"
  subnet_ids       = module.subnets.subnet_ids
  security_group_id = module.security_group.sg_id
  instance_count   = var.instance_count 
}

output "master_ips" {
  value = module.ec2.master_ips
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}
