#---------------------------------------------------
# AWS Vpc Output
#---------------------------------------------------

output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = try(module.vpc.vpc_arn, "")
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(module.vpc.vpc_id, "")
}
output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = try(module.vpc.vpc_instance_tenancy, "")
}
#------|DHCP and DNS |-------
output "vpc_dhcp_options_id" {
  description = " DHCP options id of the desired VPC"
  value       = try(module.vpc.vpc_dhcp_options_id, "")
}
output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(module.vpc.vpc_enable_dns_hostnames, "")
}
output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(module.vpc.vpc_enable_dns_support, "")
}
output "vpc_enable_network_address_usage_metrics" {
  description = "Whether Network Address Usage metrics are enabled for the VPC"
  value       = try(module.vpc.vpc_enable_network_address_usage_metrics, "")
}

#------|default NACL and Sg|-------
output "vpc_default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC"
  value       = try(module.vpc.vpc_default_network_acl_id, "")
}
output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = try(module.vpc.vpc_default_security_group_id, "")
}
#------|default Router table and his id|-------
output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an"
  value       = try(module.vpc.vpc_main_route_table_id, "")
}
output "vpc_default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation"
  value       = try(module.vpc.vpc_default_route_table_id, "")
}
#------|Ipv6|-------
output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block."
  value       = try(module.vpc.vpc_ipv6_association_id, "")
}
output "vpc_ipv6_cidr_block_network_border_group" {
  description = "The Network Border Group Zone name"
  value       = try(module.vpc.vpc_ipv6_cidr_block_network_border_group, "")
}
#------|owner and tags|-------
output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC."
  value       = try(module.vpc.vpc_owner_id, "")
}
output "vpc_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.vpc.vpc_tags_all, "")
}




#---------------------------------------------------
# AWS Subnet Output
#---------------------------------------------------

output "subnet_id" {
  description = "The ID of the subnet"
  value       = try(module.subnet.subnet_id, "")
}
output "subnet_arn" {
  description = "The ARN of the subnet."
  value       = try(module.subnet.subnet_arn, "")
}
output "subnet_ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block."
  value       = try(module.subnet.subnet_ipv6_cidr_block_association_id, "")
}
output "subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet."
  value       = try(module.subnet.subnet_owner_id, "")
}
output "subnet_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.subnet.subnet_tags_all, "")
}

#---------------------------------------------------
# AWS Route_table Output
#---------------------------------------------------

output "route_table_id" {
  description = "The ID of the routing table."
  value       = try(module.route_table.route_table_id, "")
}
output "route_table_arn" {
  description = " The ARN of the route table."
  value       = try(module.route_table.route_table_arn, "")
}
output "route_table_owner_id" {
  description = "The ID of the AWS account that owns the route table."
  value       = try(module.route_table.route_table_owner_id, "")
}
output "route_table_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.route_table.route_table_tags_all, "")
}

#---------------------------------------------------
# AWS route Output
#---------------------------------------------------
output "route_id" {
  description = "Route identifier computed from the routing table identifier and route destination."
  value       = try(module.route.id, "")
}
output "route_instance_id" {
  description = "Identifier of an EC2 instance."
  value       = try(module.route.instance_id, "")
}
output "route_instance_owner_id" {
  description = "The AWS account ID of the owner of the EC2 instance."
  value       = try(module.route.instance_owner_id, "")
}
output "route_origin" {
  description = "How the route was created - CreateRouteTable, CreateRoute or EnableVgwRoutePropagation."
  value       = try(module.route.origin, "")
}
output "route_state" {
  description = "The state of the route - active or blackhole."
  value       = try(module.route.state, "")
}

#---------------------------------------------------
# AWS route_table_association
#---------------------------------------------------
output "route_ta_association_id" {
  description = "The ID of the association"
  value       = try(module.route_table_association.route_ta_association_id, "")
}



#---------------------------------------------------
# AWS Internet_gateway Output
#---------------------------------------------------
output "internet_gateway_id" {
  description = "The ID of the internet gateway."
  value       = try(module.internet_gateway.internet_gateway_id, "")
}
output "internet_gateway_arn" {
  description = " The ARN of the internet gateway."
  value       = try(module.internet_gateway.internet_gateway_arn, "")
}
output "internet_gateway_owner_id" {
  description = "The ID of the AWS account that owns the internet gateway."
  value       = try(module.internet_gateway.internet_gateway_owner_id, "")
}
output "internet_gateway_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.internet_gateway.internet_gateway_tags_all, "")
}




#---------------------------------------------------
# AWS Nat_gateway Output
#---------------------------------------------------

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = try(module.nat_gateway.nat_gateway_id, "")
}
output "nat_gateway_public_ip" {
  description = "The Elastic IP address associated with the NAT Gateway."
  value       = try(module.nat_gateway.nat_gateway_public_ip, "")
}
output "nat_gateway_network_interface_id" {
  description = "The ID of the network interface associated with the NAT Gateway."
  value       = try(module.nat_gateway.nat_gateway_network_interface_id, "")
}
output "nat_gateway_association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT Gateway. Only available when connectivity_type is public."
  value       = try(module.nat_gateway.nat_gateway_association_id, "")
}
output "nat_gateway_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.nat_gateway.nat_gateway_tags_all, "")
}






#---------------------------------------------------
# AWS EIp Output
#---------------------------------------------------

output "eip_allocation_id" {
  description = "ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC."
  value       = try(module.eip.eip_allocation_id, "")
}
output "eip_association_id" {
  description = "ID representing the association of the address with an instance in a VPC."
  value       = try(module.eip.eip_association_id, "")
}
output "eip_carrier_ip" {
  description = "Carrier IP address."
  value       = try(module.eip.eip_carrier_ip, "")
}
output "eip_customer_owned_ip" {
  description = "Customer owned IP."
  value       = try(module.eip.eip_customer_owned_ip, "")
}
output "eip_id" {
  description = "Contains the EIP allocation ID."
  value       = try(module.eip.eip_id, "")
}
output "eip_private_dns" {
  description = "The Private DNS associated with the Elastic IP address (if in VPC)."
  value       = try(module.eip.eip_private_dns, "")
}
output "eip_private_ip" {
  description = "Contains the private IP address (if in VPC)."
  value       = try(module.eip.eip_private_ip, "")
}
output "eip_ptr_record" {
  description = "The DNS pointer (PTR) record for the IP address."
  value       = try(module.eip.eip_ptr_record, "")
}
output "eip_public_dns" {
  description = "Public DNS associated with the Elastic IP address."
  value       = try(module.eip.eip_public_dns, "")
}
output "eip_public_ip" {
  description = "Contains the public IP address."
  value       = try(module.eip.eip_public_ip, "")
}
output "eip_tags_all" {
  description = ""
  value       = try(module.eip.eip_tags_all, "")
}




#---------------------------------------------------
# AWS Network_ACL output
#---------------------------------------------------

output "network_acl_id" {
  description = "The ID of the network ACL."
  value       = try(module.network_acl.network_acl_id, "")
}
output "network_acl_arn" {
  description = "The ARN of the network ACL."
  value       = try(module.network_acl.network_acl_arn, "")
}
output "network_acl_owner_id" {
  description = "The ID of the AWS account that owns the network ACL."
  value       = try(module.network_acl.network_acl_owner_id, "")
}
output "network_acl_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = try(module.network_acl.network_acl_tags_all, "")
}
#---------------------------------------------------
# AWS network_acl_rule Output
#---------------------------------------------------
output "network_acl_rule_id_in1" {
  description = "The ID of the network ACL association"
  value       = try(module.network_acl_rule-in-1.this.*.id, "")
}
output "network_acl_rule_out1" {
  description = "The ID of the network ACL association"
  value       = try(module.network_acl_rule-out-1.this.*.id, "")
}
#---------------------------------------------------
# AWS network_acl_rule associate
#---------------------------------------------------
output "network_acl_association_id" {
  description = "The ID of the network ACL association"
  value       = try(module.network_acl_association-1.this.*.id, "")
}
output "network_acl_association_id-2" {
  description = "The ID of the network ACL association"
  value       = try(module.network_acl_association-2.this.*.id, "")
}
output "network_acl_association_id-3" {
  description = "The ID of the network ACL association"
  value       = try(module.network_acl_association-3.this.*.id, "")
}









#---------------------------------------------------
# AWS Security Group Output
#---------------------------------------------------
output "security_group_id" {
  description = "ID of the security group rule."
  value       = try(module.security_group.security_group_id, "")
}
output "security_group_arn" {
  description = "ARN of the security group."
  value       = try(module.security_group.security_group_arn, "")
}
output "security_group_owner_id" {
  description = "ID of the AWS account that owns the security group."
  value       = try(module.security_group.security_group_owner_id, "")
}
output "security_group_tags_all" {
  description = "A map of tags assigned to the security group, including those inherited from the provider default_tags configuration block."
  value       = try(module.security_group.security_group_tags_all, "")
}



#---------------------------------------------------
# AWS Security Group rule Output
#---------------------------------------------------
output "security_group_rule_id" {
  description = "ID of the security group rule."
  value       = try(module.security_group_rule.security_group_rule_id, "")
}
output "security_group_rule_security_group_rule_id" {
  description = "If the aws_security_group_rule resource has a single source or destination then this is the AWS Security Group Rule resource ID. Otherwise, it is empty."
  value       = try(module.security_group_rule.security_group_rule_security_group_rule_id, "")
}
