resource "aws_instance" "k8s_master" {
 count         = var.instance_count 
 ami           ="ami-12345678" # Replace with a Kubernetes-friendly AMI 
 instance_type ="t3.medium"

 subnet_id      =(element(var.subnet_ids, count.index))
 security_groups=[var.security_group_id]

 tags={
       Name="k8s-master-${count.index}"
 }
}
