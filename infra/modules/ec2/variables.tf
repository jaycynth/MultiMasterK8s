variable "subnet_ids" {  
 description="List of Subnet IDs for EC2 instances."
 type=list(string)
}

variable "security_group_id"{  
 description="Security group ID for EC2 instances."
 type=string  
}

variable instance_count{  
 description="Number of EC2 instances to create."
 type=number  
 default=3  
}
