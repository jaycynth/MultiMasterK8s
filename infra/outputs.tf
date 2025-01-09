output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.public_subnet.subnet_id
}

output "private_subnet_id" {
  value = module.private_subnet.subnet_id
}


output "worker_ips" {
  value = flatten([for instance in module.worker_nodes : instance.instance_ips])
}
output "master_ips" {
  value = flatten([for instance in module.master_nodes : instance.instance_ips])
}
output "bastion_ip" {
  value = flatten([for instance in module.bastion : instance.instance_ips])
}


output "k8s_lb_dns_name" {
  value = module.k8s_lb.lb_dns_name
}

output "internet_gateway_id" {
  value = module.internet_gateway.igw_id
}

output "route_table_id" {
  value = module.internet_gateway.route_table_id
}

output "route_table_association_id" {
  value = module.internet_gateway.route_table_association_id
}


output "private_key_path" {
  value = module.key_pair.private_key_path
}

output "key_pair_name" {
  value = module.key_pair.key_pair_name
}
