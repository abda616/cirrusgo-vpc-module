# ------------| VPC |--------------
module "vpc" {
  source = "../.."

  vpc_enable           = true
  vpc_instance_tenancy = "default"

  vpc_cidr_block = "10.16.0.0/16"
  vpc_tags = {
    "Name" = "task-TF"
  }

  #-------------- Not In Use ------------
  #---Ipv4 ipam
  vpc_ipv4_ipam_pool_id   = null
  vpc_ipv4_netmask_length = null

  #---Ipv6
  vpc_ipv6_cidr_block                      = null
  vpc_ipv6_ipam_pool_id                    = null
  vpc_ipv6_netmask_length                  = null
  vpc_ipv6_cidr_block_network_border_group = null

  vpc_enable_dns_support                   = true
  vpc_enable_dns_hostnames                 = false
  vpc_enable_network_address_usage_metrics = false
  vpc_assign_generated_ipv6_cidr_block     = false

}
# ------------| subnets |--------------
module "subnet" {
  source     = "../.."
  depends_on = [module.vpc]

  subnet_enable            = true
  subnet_vpc_id            = module.vpc.vpc_id
  subnet_cidr_block        = "10.16.0.0/20"
  subnet_availability_zone = "eu-west-1a"

  subnet_tags = {
    "Name" = "sub-1-a"
  }

  #------ Not in use
  subnet_assign_ipv6_address_on_creation = false
  subnet_ipv6_cidr_block                 = null
  subnet_ipv6_native                     = false
  #---------
  subnet_outpost_arn              = null
  subnet_customer_owned_ipv4_pool = null
  #---------
  subnet_enable_resource_name_dns_a_record_on_launch    = false
  subnet_enable_resource_name_dns_aaaa_record_on_launch = false
  subnet_enable_dns64                                   = false
  subnet_enable_lni_at_device_index                     = null
  subnet_private_dns_hostname_type_on_launch            = null
  #---------
  subnet_map_customer_owned_ip_on_launch = null
  subnet_map_public_ip_on_launch         = null
}
module "subnet-2" {
  source     = "../.."
  depends_on = [module.vpc]

  subnet_enable            = true
  subnet_vpc_id            = module.vpc.vpc_id
  subnet_cidr_block        = "10.16.32.0/20"
  subnet_availability_zone = "eu-west-1b"

  subnet_tags = {
    "Name" = "sub-2-b"
  }

  #------ Not in use
  subnet_assign_ipv6_address_on_creation = false
  subnet_ipv6_cidr_block                 = null
  subnet_ipv6_native                     = false
  #---------
  subnet_outpost_arn              = null
  subnet_customer_owned_ipv4_pool = null
  #---------
  subnet_enable_resource_name_dns_a_record_on_launch    = false
  subnet_enable_resource_name_dns_aaaa_record_on_launch = false
  subnet_enable_dns64                                   = false
  subnet_enable_lni_at_device_index                     = null
  subnet_private_dns_hostname_type_on_launch            = null
  #---------
  subnet_map_customer_owned_ip_on_launch = null
  subnet_map_public_ip_on_launch         = null
}
module "subnet-3" {
  source     = "../.."
  depends_on = [module.vpc]

  subnet_enable            = true
  subnet_vpc_id            = module.vpc.vpc_id
  subnet_cidr_block        = "10.16.64.0/20"
  subnet_availability_zone = "eu-west-1a"

  subnet_tags = {
    "Name" = "sub-3-a"
  }

  #------ Not in use
  subnet_assign_ipv6_address_on_creation = false
  subnet_ipv6_cidr_block                 = null
  subnet_ipv6_native                     = false
  #---------
  subnet_outpost_arn              = null
  subnet_customer_owned_ipv4_pool = null
  #---------
  subnet_enable_resource_name_dns_a_record_on_launch    = false
  subnet_enable_resource_name_dns_aaaa_record_on_launch = false
  subnet_enable_dns64                                   = false
  subnet_enable_lni_at_device_index                     = null
  subnet_private_dns_hostname_type_on_launch            = null
  #---------
  subnet_map_customer_owned_ip_on_launch = null
  subnet_map_public_ip_on_launch         = null
}

# ------------| NAT and INGw |--------------
module "internet_gateway" {
  source     = "../.."
  depends_on = [module.vpc]

  internet_gateway_enable = true

  internet_gateway_vpc_id = module.vpc.vpc_id
  internet_gateway_tags = {
    "Name" = "Igw-TF"
  }
}
module "nat_gateway" {
  source     = "../.."
  depends_on = [module.subnet, module.eip]

  nat_gateway_enable     = true
  nat_gateway_subnet_id  = module.subnet.subnet_id
  nat_gateway_private_ip = null
  #-----------|requeerd if puplic nat and need EIP|-----------
  nat_gateway_connectivity_type = "public"
  nat_gateway_allocation_id     = module.eip.eip_allocation_id # need EIP
  #-----------|secondary_private_IPs|-----------
  nat_gateway_secondary_private_ip_address_count = null
  nat_gateway_secondary_allocation_ids           = null
  nat_gateway_secondary_private_ip_addresses     = null
  #-----------|tags|-----------
  nat_gateway_tags = {
    "Name" = "Nat-TF"
  }
}
module "eip" {
  source = "../.."

  eip_enable = true

  eip_domain = "vpc"
  eip_tags = {
    "Name" = "Eip-tast-TF"
  }
  eip_network_border_group = null

  eip_network_interface = null
  eip_instance          = null

  eip_address                   = null
  eip_associate_with_private_ip = null
  eip_public_ipv4_pool          = null
  eip_customer_owned_ipv4_pool  = null
}

# ------------| router-table |--------------
module "route_table" {
  source     = "../.."
  depends_on = [module.vpc]

  route_table_enable           = true
  route_table_vpc_id           = module.vpc.vpc_id
  route_table_propagating_vgws = null
  route_table_tags = {
    "Name" = "RT-public-TF"
  }
}
module "route_table-2" {
  source     = "../.."
  depends_on = [module.vpc]

  route_table_enable           = true
  route_table_vpc_id           = module.vpc.vpc_id
  route_table_propagating_vgws = null
  route_table_tags = {
    "Name" = "RT-private-TF"
  }
}
# ------------| routes |--------------
module "route" {
  source     = "../.."
  depends_on = [module.route_table, module.nat_gateway, module.internet_gateway]

  route_enable         = true
  route_route_table_id = module.route_table.route_table_id

  route_destination_cidr_block = "0.0.0.0/0"
  route_gateway_id             = module.internet_gateway.internet_gateway_id
}
module "route-2" {
  source     = "../.."
  depends_on = [module.route_table, module.nat_gateway, module.internet_gateway]

  route_enable         = true
  route_route_table_id = module.route_table-2.route_table_id

  route_destination_cidr_block = "0.0.0.0/0"
  route_nat_gateway_id         = module.nat_gateway.nat_gateway_id
}
# ------------| Route Table Assoc |--------------
module "route_table_association" {
  source     = "../.."
  depends_on = [module.route, module.route-2, module.subnet, module.subnet-2, module.subnet-3]

  route_ta_enable = true

  route_ta_route_table_id = module.route_table.route_table_id
  route_ta_subnet_id      = module.subnet.subnet_id
  route_ta_gateway_id     = null
}
module "route_table_association-2" {
  source     = "../.."
  depends_on = [module.route, module.route-2, module.subnet, module.subnet-2, module.subnet-3]

  route_ta_enable = true

  route_ta_route_table_id = module.route_table.route_table_id
  route_ta_subnet_id      = module.subnet-2.subnet_id
  route_ta_gateway_id     = null
}
module "route_table_association-3" {
  source     = "../.."
  depends_on = [module.route, module.route-2, module.subnet, module.subnet-2, module.subnet-3]

  route_ta_enable = true

  route_ta_route_table_id = module.route_table-2.route_table_id
  route_ta_subnet_id      = module.subnet-3.subnet_id
  route_ta_gateway_id     = null
}






# ------------| NACL |--------------
module "network_acl" {
  source     = "../.."
  depends_on = [module.subnet, module.subnet-2, module.subnet-3]

  network_acl_enable     = true
  network_acl_vpc_id     = module.vpc.vpc_id
  network_acl_subnet_ids = null
  network_acl_ingress    = null
  network_acl_egress     = null

  network_acl_tags = {
    "Name" = "task-public-TF"
  }
}


module "network_acl_association-1" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_association_enable         = true
  network_acl_association_network_acl_id = module.network_acl.network_acl_id
  network_acl_association_subnet_id      = module.subnet.subnet_id
}
module "network_acl_association-2" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_association_enable         = true
  network_acl_association_network_acl_id = module.network_acl.network_acl_id
  network_acl_association_subnet_id      = module.subnet-2.subnet_id
}
module "network_acl_association-3" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_association_enable         = true
  network_acl_association_network_acl_id = module.network_acl.network_acl_id
  network_acl_association_subnet_id      = module.subnet-3.subnet_id
}



module "network_acl_rule-in-1" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = false

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 20
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "18.202.216.48/29"
  network_acl_rule_from_port      = 22
  network_acl_rule_to_port        = 22
}
module "network_acl_rule-out-1" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true

  network_acl_rule_egress = true

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 20
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 1024
  network_acl_rule_to_port        = 65535
}
module "network_acl_rule-in-2" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = false

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 10
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 80
  network_acl_rule_to_port        = 80
}
module "network_acl_rule-out-2" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = true

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 10
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 1024
  network_acl_rule_to_port        = 65535
}

module "network_acl_rule-in-3" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = false

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 30
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 1024
  network_acl_rule_to_port        = 65535
}
module "network_acl_rule-out-3" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = true

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 30
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 80
  network_acl_rule_to_port        = 80
}
module "network_acl_rule-in-4" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = false

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 40
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 443
  network_acl_rule_to_port        = 443
}

module "network_acl_rule-out-4" {
  source     = "../.."
  depends_on = [module.network_acl]

  network_acl_rule_enable = true
  network_acl_rule_egress = true

  network_acl_rule_network_acl_id = module.network_acl.network_acl_id
  network_acl_rule_rule_action    = "allow"
  network_acl_rule_rule_number    = 40
  network_acl_rule_protocol       = "tcp"
  network_acl_rule_cidr_block     = "0.0.0.0/0"
  network_acl_rule_from_port      = 443
  network_acl_rule_to_port        = 443
}








# ------------| SubGroup |--------------
module "security_group" {
  source     = "../.."
  depends_on = [module.vpc]

  security_group_enable = true
  security_group_vpc_id = module.vpc.vpc_id
  security_group_name   = "task-TF-sg1"

  security_group_description = "TF sg"
  security_group_tags = {
    "Name" = "task-TF-sg1"
  }
  security_group_egress  = null
  security_group_ingress = null

  security_group_name_prefix            = null
  security_group_revoke_rules_on_delete = null
}
module "security_group_rule" {
  source     = "../.."
  depends_on = [module.vpc, module.security_group]

  security_group_rule_enable = true

  security_group_rule_security_group_id = module.security_group.security_group_id

  security_group_rule_type        = "ingress"
  security_group_rule_from_port   = 22
  security_group_rule_to_port     = 22
  security_group_rule_protocol    = "tcp"
  security_group_rule_description = "TF sg ssh"
  security_group_rule_cidr_blocks = ["18.202.216.48/29"]
}
module "security_group_rule-2" {
  source     = "../.."
  depends_on = [module.vpc, module.security_group]

  security_group_rule_enable = true

  security_group_rule_security_group_id = module.security_group.security_group_id

  security_group_rule_type        = "ingress"
  security_group_rule_from_port   = 80
  security_group_rule_to_port     = 80
  security_group_rule_protocol    = "tcp"
  security_group_rule_description = "TF sg http"
  security_group_rule_cidr_blocks = ["0.0.0.0/0"]
}
module "security_group_rule-3" {
  source     = "../.."
  depends_on = [module.vpc, module.security_group]

  security_group_rule_enable = true

  security_group_rule_security_group_id = module.security_group.security_group_id

  security_group_rule_type        = "egress"
  security_group_rule_from_port   = 0
  security_group_rule_to_port     = 65535
  security_group_rule_protocol    = "all"
  security_group_rule_description = "TF sg allow all outbound"
  security_group_rule_cidr_blocks = ["0.0.0.0/0"]
}

