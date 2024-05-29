module "vpc" {
  source = "../"

  vpc_enable = var.vpc_enable

  vpc_cidr_block       = var.vpc_cidr_block
  vpc_instance_tenancy = var.vpc_instance_tenancy

  vpc_ipv4_ipam_pool_id   = var.vpc_ipv4_ipam_pool_id
  vpc_ipv4_netmask_length = var.vpc_ipv4_netmask_length
  #---------
  vpc_ipv6_cidr_block                      = var.vpc_ipv6_cidr_block
  vpc_ipv6_ipam_pool_id                    = var.vpc_ipv6_ipam_pool_id
  vpc_ipv6_netmask_length                  = var.vpc_ipv6_netmask_length
  vpc_ipv6_cidr_block_network_border_group = var.vpc_ipv6_cidr_block_network_border_group
  #---------
  vpc_enable_dns_support                   = var.vpc_enable_dns_support
  vpc_enable_dns_hostnames                 = var.vpc_enable_dns_hostnames
  vpc_enable_network_address_usage_metrics = var.vpc_enable_network_address_usage_metrics
  vpc_assign_generated_ipv6_cidr_block     = var.vpc_assign_generated_ipv6_cidr_block
  #---------
  vpc_tags = var.vpc_tags
}
module "subnet" {
  source = "../"

  subnet_enable = var.subnet_enable
  subnet_vpc_id = var.subnet_vpc_id
  #---------
  subnet_cidr_block           = var.subnet_cidr_block
  subnet_availability_zone    = var.subnet_availability_zone
  subnet_availability_zone_id = var.subnet_availability_zone_id
  #---------
  subnet_assign_ipv6_address_on_creation = var.subnet_assign_ipv6_address_on_creation
  subnet_ipv6_cidr_block                 = var.subnet_ipv6_cidr_block
  subnet_ipv6_native                     = var.subnet_ipv6_native
  #---------
  subnet_outpost_arn              = var.subnet_outpost_arn
  subnet_customer_owned_ipv4_pool = var.subnet_customer_owned_ipv4_pool
  #---------
  subnet_enable_resource_name_dns_a_record_on_launch    = var.subnet_enable_resource_name_dns_a_record_on_launch
  subnet_enable_resource_name_dns_aaaa_record_on_launch = var.subnet_enable_resource_name_dns_aaaa_record_on_launch
  subnet_enable_dns64                                   = var.subnet_enable_dns64
  subnet_enable_lni_at_device_index                     = var.subnet_enable_lni_at_device_index
  subnet_private_dns_hostname_type_on_launch            = var.subnet_private_dns_hostname_type_on_launch
  #---------
  subnet_map_customer_owned_ip_on_launch = var.subnet_map_customer_owned_ip_on_launch
  subnet_map_public_ip_on_launch         = var.subnet_map_public_ip_on_launch
  #---------
  subnet_tags = var.subnet_tags
}


module "internet_gateway" {
  source = "../"

  internet_gateway_enable = var.internet_gateway_enable

  internet_gateway_vpc_id = var.internet_gateway_vpc_id
  internet_gateway_tags   = var.internet_gateway_tags
}
module "nat_gateway" {
  source = "../"

  nat_gateway_enable = var.nat_gateway_enable

  nat_gateway_subnet_id  = var.nat_gateway_subnet_id  # public subnet id
  nat_gateway_private_ip = var.nat_gateway_private_ip # optional will be alocated in the public subnet

  #-----------|requeerd if puplic nat and need EIP|-----------
  nat_gateway_connectivity_type = var.nat_gateway_connectivity_type # public | private
  nat_gateway_allocation_id     = var.nat_gateway_allocation_id     # need EIP

  #-----------|secondary_private_IPs|-----------
  nat_gateway_secondary_private_ip_address_count = var.nat_gateway_secondary_private_ip_address_count
  nat_gateway_secondary_allocation_ids           = var.nat_gateway_secondary_allocation_ids
  nat_gateway_secondary_private_ip_addresses     = var.nat_gateway_secondary_private_ip_addresses

  #-----------|tags|-----------
  nat_gateway_tags = var.nat_gateway_tags
}


module "route_table" {
  source = "../"

  route_table_enable = var.route_table_enable

  route_table_vpc_id           = var.route_table_vpc_id
  route_table_route            = var.route_table_route
  route_table_propagating_vgws = var.route_table_propagating_vgws
  route_table_tags             = var.route_table_tags
}
module "route" {
  source = "../"

  route_enable = var.route_enable

  route_route_table_id = var.route_route_table_id

  #---------One of the following destination arguments must be supplied:
  route_destination_cidr_block      = var.route_destination_cidr_block
  route_destination_ipv6_cidr_block = var.route_destination_ipv6_cidr_block
  route_destination_prefix_list_id  = var.route_destination_prefix_list_id

  #------------------ One of the following target arguments must be supplied:
  route_carrier_gateway_id        = var.route_carrier_gateway_id
  route_core_network_arn          = var.route_core_network_arn
  route_egress_only_gateway_id    = var.route_egress_only_gateway_id
  route_gateway_id                = var.route_gateway_id
  route_nat_gateway_id            = var.route_nat_gateway_id
  route_local_gateway_id          = var.route_local_gateway_id
  route_network_interface_id      = var.route_network_interface_id
  route_transit_gateway_id        = var.route_transit_gateway_id
  route_vpc_endpoint_id           = var.route_vpc_endpoint_id
  route_vpc_peering_connection_id = var.route_vpc_peering_connection_id


}
module "route_table_association" {
  source          = "../"
  route_ta_enable = var.route_ta_enable

  route_ta_route_table_id = var.route_ta_route_table_id
  route_ta_subnet_id      = var.route_ta_subnet_id
  route_ta_gateway_id     = var.route_ta_gateway_id
}


module "eip" {
  source = "../"

  eip_enable = var.eip_enable

  eip_domain               = var.eip_domain
  eip_network_border_group = var.eip_network_border_group

  eip_network_interface = var.eip_network_interface
  eip_instance          = var.eip_instance

  eip_address                   = var.eip_address
  eip_associate_with_private_ip = var.eip_associate_with_private_ip
  eip_public_ipv4_pool          = var.eip_public_ipv4_pool
  eip_customer_owned_ipv4_pool  = var.eip_customer_owned_ipv4_pool

  eip_tags = var.eip_tags

}
module "network_acl" {
  source = "../"

  network_acl_enable = var.network_acl_enable

  network_acl_vpc_id     = var.network_acl_vpc_id
  network_acl_subnet_ids = var.network_acl_subnet_ids

  network_acl_ingress = var.network_acl_ingress
  network_acl_egress  = var.network_acl_egress

  network_acl_tags = var.network_acl_tags
}
module "network_acl_rule" {
  source = "../"

  network_acl_rule_enable = var.network_acl_rule_enable

  network_acl_rule_network_acl_id = var.network_acl_rule_network_acl_id
  network_acl_rule_rule_number    = var.network_acl_rule_rule_number
  network_acl_rule_rule_action    = var.network_acl_rule_rule_action
  network_acl_rule_egress         = var.network_acl_rule_egress

  network_acl_rule_cidr_block      = var.network_acl_rule_cidr_block
  network_acl_rule_ipv6_cidr_block = var.network_acl_rule_ipv6_cidr_block

  network_acl_rule_from_port = var.network_acl_rule_from_port
  network_acl_rule_to_port   = var.network_acl_rule_to_port

  network_acl_rule_protocol  = var.network_acl_rule_protocol
  network_acl_rule_icmp_type = var.network_acl_rule_icmp_type
  network_acl_rule_icmp_code = var.network_acl_rule_icmp_code

}
module "network_acl_association" {
  source = "../"

  network_acl_association_enable = var.network_acl_association_enable

  network_acl_association_subnet_id      = var.network_acl_association_subnet_id
  network_acl_association_network_acl_id = var.network_acl_association_network_acl_id
}


module "security_group" {
  source = "../"

  security_group_enable = var.security_group_enable

  security_group_vpc_id = var.security_group_vpc_id
  security_group_name   = var.security_group_name

  security_group_description = var.security_group_description
  security_group_egress      = var.security_group_egress
  security_group_ingress     = var.security_group_ingress

  security_group_name_prefix            = var.security_group_name_prefix
  security_group_revoke_rules_on_delete = var.security_group_revoke_rules_on_delete

  security_group_tags = var.security_group_tags
}
module "security_group_rule" {
  source = "../"

  security_group_rule_enable = var.security_group_rule_enable

  security_group_rule_security_group_id = var.security_group_rule_security_group_id
  security_group_rule_type              = var.security_group_rule_type

  security_group_rule_from_port = var.security_group_rule_from_port
  security_group_rule_to_port   = var.security_group_rule_to_port
  security_group_rule_protocol  = var.security_group_rule_protocol

  security_group_rule_cidr_blocks              = var.security_group_rule_cidr_blocks
  security_group_rule_ipv6_cidr_blocks         = var.security_group_rule_ipv6_cidr_blocks
  security_group_rule_description              = var.security_group_rule_description
  security_group_rule_self                     = var.security_group_rule_self
  security_group_rule_prefix_list_ids          = var.security_group_rule_prefix_list_ids
  security_group_rule_source_security_group_id = var.security_group_rule_source_security_group_id
}
