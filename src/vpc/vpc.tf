resource "aws_vpc" "this" {
  count = var.vpc_enable ? 1 : 0

  cidr_block          = var.vpc_cidr_block
  instance_tenancy    = var.vpc_instance_tenancy
  ipv4_ipam_pool_id   = var.vpc_ipv4_ipam_pool_id
  ipv4_netmask_length = var.vpc_ipv4_netmask_length
  #---------
  ipv6_cidr_block                      = var.vpc_ipv6_cidr_block
  ipv6_ipam_pool_id                    = var.vpc_ipv6_ipam_pool_id
  ipv6_netmask_length                  = var.vpc_ipv6_netmask_length
  ipv6_cidr_block_network_border_group = var.vpc_ipv6_cidr_block_network_border_group
  #---------
  enable_dns_support                   = var.vpc_enable_dns_support
  enable_dns_hostnames                 = var.vpc_enable_dns_hostnames
  enable_network_address_usage_metrics = var.vpc_enable_network_address_usage_metrics
  assign_generated_ipv6_cidr_block     = var.vpc_assign_generated_ipv6_cidr_block
  #---------
  tags = var.vpc_tags
}
