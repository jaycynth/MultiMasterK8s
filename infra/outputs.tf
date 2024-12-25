
output "master_ips" {
  value = module.ec2.master_ips
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}
