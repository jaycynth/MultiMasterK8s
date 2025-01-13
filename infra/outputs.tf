output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.public_subnet.subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.private_subnet.subnet_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.nat_gateway.nat_gateway_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}



output "bastion_host_ids" {
  description = "IDs of the Bastion Hosts"
  value       = flatten([for obj in module.bastion : obj.instance_ips])

}


output "master_node_ids" {
  description = "IDs of the master nodes"
  value       = flatten([for obj in module.master_nodes : obj.instance_ips])

}

output "worker_node_ids" {
  description = "IDs of the worker nodes"
  value       = flatten([for obj in module.worker_nodes : obj.instance_ips])

}

output "load_balancer_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.k8s_lb.lb_dns_name
}
