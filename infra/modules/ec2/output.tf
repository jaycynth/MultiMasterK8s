
output master_ips {  
 value=aws_instance.k8s_master[*].public_ip  
}
