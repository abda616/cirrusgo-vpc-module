#---------------------------------------------------
# AWS Vpc Output
#---------------------------------------------------

output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = try(element(concat(aws_vpc.this.*.arn, [""]), 0), "")
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(element(concat(aws_vpc.this.*.id, [""]), 0), "")
}
output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = try(element(concat(aws_vpc.this.*.instance_tenancy, [""]), 0), "")
}
#------|DHCP and DNS |-------
output "vpc_dhcp_options_id" {
  description = " DHCP options id of the desired VPC"
  value       = try(element(concat(aws_vpc.this.*.dhcp_options_id, [""]), 0), "")
}
output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(element(concat(aws_vpc.this.*.enable_dns_hostnames, [""]), 0), "")
}
output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(element(concat(aws_vpc.this.*.enable_dns_support, [""]), 0), "")
}
output "vpc_enable_network_address_usage_metrics" {
  description = "Whether Network Address Usage metrics are enabled for the VPC"
  value       = try(element(concat(aws_vpc.this.*.enable_network_address_usage_metrics, [""]), 0), "")
}

#------|default NACL and Sg|-------
output "vpc_default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC"
  value       = try(element(concat(aws_vpc.this.*.default_network_acl_id, [""]), 0), "")
}
output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = try(element(concat(aws_vpc.this.*.default_security_group_id, [""]), 0), "")
}
#------|default Router table and his id|-------
output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an"
  value       = try(element(concat(aws_vpc.this.*.main_route_table_id, [""]), 0), "")
}
output "vpc_default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation"
  value       = try(element(concat(aws_vpc.this.*.default_route_table_id, [""]), 0), "")
}
#------|Ipv6|-------
output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block."
  value       = try(element(concat(aws_vpc.this.*.ipv6_association_id, [""]), 0), "")
}
output "vpc_ipv6_cidr_block_network_border_group" {
  description = "The Network Border Group Zone name"
  value       = try(element(concat(aws_vpc.this.*.ipv6_cidr_block_network_border_group, [""]), 0), "")
}
#------|owner and tags|-------
output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC."
  value       = try(element(concat(aws_vpc.this.*.owner_id, [""]), 0), "")
}
output "vpc_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_vpc.this.*.tags_all, "")
}




#---------------------------------------------------
# AWS Subnet Output
#---------------------------------------------------

output "subnet_id" {
  description = "The ID of the subnet"
  value       = try(element(concat(aws_subnet.this.*.id), 0), "")
}
output "subnet_arn" {
  description = "The ARN of the subnet."
  value       = try(element(concat(aws_subnet.this.*.arn, [""]), 0), "")
}
output "subnet_ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block."
  value       = try(element(concat(aws_subnet.this.*.ipv6_cidr_block_association_id, [""]), 0), "")
}
output "subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet."
  value       = try(element(concat(aws_subnet.this.*.owner_id, [""]), 0), "")
}
output "subnet_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_subnet.this.*.tags_all, "")
}











#---------------------------------------------------
# AWS Route_table Output
#---------------------------------------------------

output "route_table_id" {
  description = "The ID of the routing table."
  value       = try(element(concat(aws_route_table.this.*.id), 0), "")
}
output "route_table_arn" {
  description = " The ARN of the route table."
  value       = try(element(concat(aws_route_table.this.*.arn), 0), "")
}
output "route_table_owner_id" {
  description = "The ID of the AWS account that owns the route table."
  value       = try(element(concat(aws_route_table.this.*.owner_id), 0), "")
}
output "route_table_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_route_table.this.*.tags_all, "")
}

#---------------------------------------------------
# AWS route Output
#---------------------------------------------------
output "route_id" {
  description = "Route identifier computed from the routing table identifier and route destination."
  value       = try(element(concat(aws_route.this.*.id), 0), "")
}
output "route_instance_id" {
  description = "Identifier of an EC2 instance."
  value       = try(element(concat(aws_route.this.*.instance_id, ), 0), "")
}
output "route_instance_owner_id" {
  description = "The AWS account ID of the owner of the EC2 instance."
  value       = try(element(concat(aws_route.this.*.instance_owner_id), 0), "")
}
output "route_origin" {
  description = "How the route was created - CreateRouteTable, CreateRoute or EnableVgwRoutePropagation."
  value       = try(element(concat(aws_route.this.*.origin), 0), "")
}
output "route_state" {
  description = "The state of the route - active or blackhole."
  value       = try(element(concat(aws_route.this.*.state), 0), "")
}

#---------------------------------------------------
# AWS route_table_association
#---------------------------------------------------
output "route_ta_association_id" {
  description = "The ID of the association"
  value       = try(element(concat(aws_route_table_association.this.*.id), 0), "")
}










#---------------------------------------------------
# AWS Internet_gateway Output
#---------------------------------------------------
output "internet_gateway_id" {
  description = "The ID of the routing table."
  value       = try(element(concat(aws_internet_gateway.this.*.id), 0), "")
}
output "internet_gateway_arn" {
  description = " The ARN of the route table."
  value       = try(element(concat(aws_internet_gateway.this.*.arn), 0), "")
}
output "internet_gateway_owner_id" {
  description = "The ID of the AWS account that owns the route table."
  value       = try(element(concat(aws_internet_gateway.this.*.owner_id), 0), "")
}
output "internet_gateway_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_internet_gateway.this.*.tags_all, "")
}






#---------------------------------------------------
# AWS Nat_gateway Output
#---------------------------------------------------

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = try(element(concat(aws_nat_gateway.this.*.id), 0), "")
}
output "nat_gateway_public_ip" {
  description = "The Elastic IP address associated with the NAT Gateway."
  value       = try(element(concat(aws_nat_gateway.this.*.public_ip), 0), "")
}
output "nat_gateway_network_interface_id" {
  description = " The ID of the network interface associated with the NAT Gateway."
  value       = try(element(concat(aws_nat_gateway.this.*.network_interface_id), 0), "")
}
output "nat_gateway_association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT Gateway. Only available when connectivity_type is public."
  value       = try(element(concat(aws_nat_gateway.this.*.association_id), 0), "")
}
output "nat_gateway_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_nat_gateway.this.*.tags_all, "")
}






#---------------------------------------------------
# AWS EIp Output
#---------------------------------------------------

output "eip_allocation_id" {
  description = "ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC."
  value       = try(element(concat(aws_eip.this.*.allocation_id), 0), "")
}
output "eip_association_id" {
  description = "ID representing the association of the address with an instance in a VPC."
  value       = try(element(concat(aws_eip.this.*.association_id), 0), "")
}
output "eip_carrier_ip" {
  description = "Carrier IP address."
  value       = try(element(concat(aws_eip.this.*.carrier_ip), 0), "")
}
output "eip_customer_owned_ip" {
  description = "Customer owned IP."
  value       = try(element(concat(aws_eip.this.*.customer_owned_ip), 0), "")
}
output "eip_id" {
  description = "Contains the EIP allocation ID."
  value       = try(element(concat(aws_eip.this.*.id), 0), "")
}
output "eip_private_dns" {
  description = "The Private DNS associated with the Elastic IP address (if in VPC)."
  value       = try(element(concat(aws_eip.this.*.private_dns), 0), "")
}
output "eip_private_ip" {
  description = "Contains the private IP address (if in VPC)."
  value       = try(element(concat(aws_eip.this.*.private_ip), 0), "")
}
output "eip_ptr_record" {
  description = "The DNS pointer (PTR) record for the IP address."
  value       = try(element(concat(aws_eip.this.*.ptr_record), 0), "")
}
output "eip_public_dns" {
  description = "Public DNS associated with the Elastic IP address."
  value       = try(element(concat(aws_eip.this.*.public_dns), 0), "")
}
output "eip_public_ip" {
  description = "Contains the public IP address."
  value       = try(element(concat(aws_eip.this.*.public_ip), 0), "")
}

output "eip_tags_all" {
  description = ""
  value       = try(aws_eip.this.*.tags_all, "")
}






#---------------------------------------------------
# AWS Network_ACL output
#---------------------------------------------------

output "network_acl_id" {
  description = "The ID of the network ACL"
  value       = try(element(concat(aws_network_acl.this.*.id), 0), "")
}
output "network_acl_arn" {
  description = "The ARN of the network ACL"
  value       = try(element(concat(aws_network_acl.this.*.arn), 0), "")
}
output "network_acl_owner_id" {
  description = "The ID of the AWS account that owns the network ACL."
  value       = try(element(concat(aws_network_acl.this.*.owner_id), 0), "")
}
output "network_acl_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(aws_network_acl.this.*.tags_all, "")
}
#---------------------------------------------------
# AWS network_acl_rule Output
#---------------------------------------------------
output "network_acl_rule_id" {
  description = "The ID of the network ACL association"
  value       = try(element(concat(aws_network_acl_rule.this.*.id), 0), "")
}

#---------------------------------------------------
# AWS network_acl_rule associate
#---------------------------------------------------

output "network_acl_association_id" {
  description = "The ID of the network ACL association"
  value       = try(element(concat(aws_network_acl_association.this.*.id), 0), "")
}












#---------------------------------------------------
# AWS Security Group Output
#---------------------------------------------------
output "security_group_id" {
  description = " ID of the security group rule."
  value       = try(element(concat(aws_security_group.this.*.id), 0), "")
}
output "security_group_arn" {
  description = " ID of the security group rule."
  value       = try(element(concat(aws_security_group.this.*.arn), 0), "")
}
output "security_group_owner_id" {
  description = " ID of the security group rule."
  value       = try(element(concat(aws_security_group.this.*.owner_id), 0), "")
}
output "security_group_tags_all" {
  description = " ID of the security group rule."
  value       = try(aws_security_group.this.*.tags_all, "")
}


#---------------------------------------------------
# AWS Security Group rule Output
#---------------------------------------------------
output "security_group_rule_id" {
  description = " ID of the security group rule."
  value       = try(element(concat(aws_security_group_rule.this.*.id), 0), "")
}
output "security_group_rule_security_group_rule_id" {
  description = " If the aws_security_group_rule resource has a single source or destination then this is the AWS Security Group Rule resource ID. Otherwise it is empty."
  value       = try(element(concat(aws_security_group_rule.this.*.security_group_rule_id), 0), "")
}
