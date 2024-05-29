#---------------------------------------------------
# AWS Vpc Variables
#---------------------------------------------------

variable "vpc_enable" {
  type        = bool
  description = "(Required) Whether creat Vpc or not"
  default     = false
}

#-----|IPv4|-----
variable "vpc_cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length"
  default     = null #"10.0.0.0/16"
}
variable "vpc_instance_tenancy" {
  type        = string
  description = "(Optional) A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
  default     = "default" # default | dedicated
}
variable "vpc_ipv4_ipam_pool_id" {
  type        = string
  description = "(Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts. Using IPAM you can monitor IP address usage throughout your AWS Organization."
  default     = null
}
variable "vpc_ipv4_netmask_length" {
  type        = number
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id."
  default     = null
}
#-----|IPv6|-----
variable "vpc_ipv6_cidr_block" {
  type        = string
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length."
  default     = null
}
variable "vpc_ipv6_ipam_pool_id" {
  type        = string
  description = "(Optional) IPAM Pool ID for a IPv6 pool. Conflicts with assign_generated_ipv6_cidr_block"
  default     = null
}
variable "vpc_ipv6_netmask_length" {
  type        = number
  description = "(Optional) Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values: 56"
  default     = null
}
variable "vpc_ipv6_cidr_block_network_border_group" {
  type        = string
  description = " (Optional) By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones."
  default     = null
}
#-----|DNS |-----
variable "vpc_enable_dns_support" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  default     = true
}
variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default     = false
}
variable "vpc_enable_network_address_usage_metrics" {
  type        = bool
  description = "(Optional) Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false."
  default     = false
}
variable "vpc_assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id"
  default     = false
}
#-----|tags|-----
variable "vpc_tags" {
  type        = map(string)
  description = " (Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}









#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Subnet Variables
#---------------------------------------------------

variable "subnet_enable" {
  type        = bool
  description = "(Required) Whether creat Subnet or not"
  default     = false
}

variable "subnet_vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
  default     = ""
}
variable "subnet_cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the subnet."
  default     = null
}
variable "subnet_availability_zone" {
  type        = string
  description = "(Optional) AZ for the subnet"
  default     = null
}
variable "subnet_availability_zone_id" {
  type        = string
  description = "(Optional) AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use availability_zone instead."
  default     = null
}
#-------------|Ipv6|---------
variable "subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  default     = false
}
variable "subnet_ipv6_cidr_block" {
  type        = string
  description = "(Optional) The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
  default     = null
}
variable "subnet_ipv6_native" {
  type        = bool
  description = "(Optional) Indicates whether to create an IPv6-only subnet. Default: false."
  default     = false
}
#-------------|Outpost|---------
variable "subnet_outpost_arn" {
  type        = string
  description = "(Optional) The Amazon Resource Name (ARN) of the Outpost."
  default     = null
}
variable "subnet_customer_owned_ipv4_pool" {
  type        = string
  description = "(Optional) The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured."
  default     = null
}
#-------------|dns/64|---------
variable "subnet_enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
  default     = false
}
variable "subnet_enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false."
  default     = false
}
variable "subnet_enable_dns64" {
  type        = bool
  description = "(Optional) Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
  default     = false
}
variable "subnet_enable_lni_at_device_index" {
  type        = number
  description = " (Optional) Indicates the device position for local network interfaces in this subnet. For example, 1 indicates local network interfaces in this subnet are the secondary network interface (eth1). A local network interface cannot be the primary network interface (eth0)."
  default     = null # 0 | 1
}
variable "subnet_private_dns_hostname_type_on_launch" {
  type        = string
  description = "(Optional) The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name."
  default     = null
}
#-------------|subnet map|---------
variable "subnet_map_customer_owned_ip_on_launch" {
  type        = bool
  description = " (Optional) Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false."
  default     = null
}
variable "subnet_map_public_ip_on_launch" {
  type        = bool
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  default     = null
}
#-------------|subnet tags|---------
variable "subnet_tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}









#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Route_table Variables
#---------------------------------------------------

variable "route_table_enable" {
  type        = bool
  description = "(Required) Whether creat Route_table or not"
  default     = false
}

variable "route_table_vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
  default     = ""
}
variable "route_table_route" {
  type        = any
  description = "(Optional) A list of route objects. Their keys are documented below. This argument is processed in attribute-as-blocks mode. This means that omitting this argument is interpreted as ignoring any existing routes. To remove all managed routes an empty list should be specified. See the example above."
  default     = null
}
variable "route_table_propagating_vgws" {
  type        = list(string)
  description = "(Optional) A list of virtual gateways for propagation."
  default     = [""]
}
variable "route_table_tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}





#---------------------------------------------------
# AWS route Variables
#---------------------------------------------------
variable "route_enable" {
  type        = bool
  description = "(Required) Whether creat route_enable or not"
  default     = false
}
variable "route_route_table_id" {
  type        = string
  description = "(Required) The ID of the routing table"
  default     = ""
}
#---------One of the following destination arguments must be supplied:
variable "route_destination_cidr_block" {
  type        = string
  description = "(Optional) The destination CIDR block."
  default     = null
}
variable "route_destination_ipv6_cidr_block" {
  type        = string
  description = "(Optional) The destination IPv6 CIDR block."
  default     = null
}
variable "route_destination_prefix_list_id" {
  type        = string
  description = "(Optional) The ID of a managed prefix list destination."
  default     = null
}
#------------------ One of the following target arguments must be supplied:
variable "route_carrier_gateway_id" {
  type        = string
  description = " (Optional) Identifier of a carrier gateway. This attribute can only be used when the VPC contains a subnet which is associated with a Wavelength Zone."
  default     = null
}
variable "route_core_network_arn" {
  type        = string
  description = "(Optional) The Amazon Resource Name (ARN) of a core network."
  default     = null
}
variable "route_egress_only_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway."
  default     = null
}
variable "route_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway. Specify local when updating a previously imported local route."
  default     = null
}
variable "route_nat_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC NAT gateway."
  default     = null
}
variable "route_local_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a Outpost local gateway."
  default     = null
}
variable "route_network_interface_id" {
  type        = string
  description = "(Optional) Identifier of an EC2 network interface."
  default     = null
}
variable "route_transit_gateway_id" {
  type        = string
  description = "(Optional) Identifier of an EC2 Transit Gateway."
  default     = null
}
variable "route_vpc_endpoint_id" {
  type        = string
  description = "(Optional) Identifier of a VPC Endpoint."
  default     = null
}
variable "route_vpc_peering_connection_id" {
  type        = string
  description = "(Optional) Identifier of a VPC peering connection."
  default     = null
}




#---------------------------------------------------
# AWS route_table_association Variables
#---------------------------------------------------
variable "route_ta_enable" {
  type        = bool
  description = "(Required) Whether creat route_ta_enable or not"
  default     = false
}

variable "route_ta_route_table_id" {
  description = "(Required) The ID of the routing table to associate with."
  type        = string
  default     = ""
}
variable "route_ta_subnet_id" {
  description = "(Optional) The subnet ID to create an association. Conflicts with gateway_id."
  type        = string
  default     = null
}
variable "route_ta_gateway_id" {
  description = "(Optional) The gateway ID to create an association. Conflicts with subnet_id."
  type        = string
  default     = null
}






#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Internet_gateway Variables
#---------------------------------------------------

variable "internet_gateway_enable" {
  type        = bool
  description = "(Required) Whether creat Internet_gateway or not"
  default     = false
}

variable "internet_gateway_vpc_id" {
  type        = string
  description = "(Optional) The VPC ID to create in. See the aws_internet_gateway_attachment resource for an alternate way to attach an Internet Gateway to a VPC."
  default     = null
}
variable "internet_gateway_tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}




#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Nat_gateway Variables
#---------------------------------------------------

variable "nat_gateway_enable" {
  type        = bool
  description = "(Required) Whether creat Nat_gateway or not"
  default     = false
}

variable "nat_gateway_subnet_id" {
  type        = string
  description = "(Required) The Subnet ID of the subnet in which to place the NAT Gateway."
  default     = ""
}
variable "nat_gateway_private_ip" {
  type        = string
  description = "(Optional) The private IPv4 address to assign to the NAT Gateway. If you don't provide an address, a private IPv4 address will be automatically assigned."
  default     = null
}

#-----------|requeerd if puplic nat and need EIP|-----------
variable "nat_gateway_connectivity_type" {
  type        = string
  description = "(Optional) Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public."
  default     = null # private | public
}
variable "nat_gateway_allocation_id" {
  type        = string
  description = "(Optional) The Allocation ID of the Elastic IP address for the NAT Gateway. (Required) for connectivity_type of public."
  default     = null #string( Elastic IP id)
}

#-----------|secondary_private_IPs|-----------
variable "nat_gateway_secondary_allocation_ids" {
  type        = list(string)
  description = "(Optional) A list of secondary allocation EIP IDs for this NAT Gateway."
  default     = [""] # {}
}
variable "nat_gateway_secondary_private_ip_address_count" {
  type        = number
  description = "(Optional) [Private NAT Gateway only] The number of secondary private IPv4 addresses you want to assign to the NAT Gateway."
  default     = null # 0
}
variable "nat_gateway_secondary_private_ip_addresses" {
  type        = list(string)
  description = "(Optional) A list of secondary private IPv4 addresses to assign to the NAT Gateway."
  default     = [""] #{}
}
#-----------|tags|-----------
variable "nat_gateway_tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

#---------------------------------------------------
# AWS EIP Variables
#---------------------------------------------------
variable "eip_enable" {
  type        = bool
  description = "(Required) Whether creat Network ACL or not"
  default     = false
}

variable "eip_domain" {
  type        = string
  description = "Indicates if this EIP is for use in VPC (vpc)"
  default     = "vpc"
}
variable "eip_network_border_group" {
  type        = string
  description = "(Optional) Location from which the IP address is advertised. Use this parameter to limit the address to this location."
  default     = null
}

variable "eip_address" {
  type        = string
  description = "(Optional) IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs."
  default     = null
}
variable "eip_associate_with_private_ip" {
  type        = string
  description = "(Optional) User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address."
  default     = null
}
variable "eip_customer_owned_ipv4_pool" {
  type        = string
  description = " (Optional) ID of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide."
  default     = null
}


variable "eip_instance" {
  type        = string
  description = "(Optional) EC2 instance ID."
  default     = null
}
variable "eip_network_interface" {
  type        = string
  description = "(Optional) Network interface ID to associate with."
  default     = null
}

variable "eip_public_ipv4_pool" {
  type        = string
  description = "(Optional) EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs."
  default     = null
}
variable "eip_tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the resource. Tags can only be applied to EIPs in a VPC. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}










#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Network_ACL Variables
#---------------------------------------------------

variable "network_acl_enable" {
  type        = bool
  description = "(Required) Whether creat Network ACL or not"
  default     = false
}


variable "network_acl_vpc_id" {
  type        = string
  description = "(Required) The ID of the associated VPC."
  default     = ""
}
variable "network_acl_subnet_ids" {
  type        = any
  description = "(Optional) A list of Subnet IDs to apply the ACL to"
  default     = null
}
variable "network_acl_tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}
variable "network_acl_ingress" {
  type        = any
  description = "(Optional) Specifies an ingress rule. Parameters defined below. This argument is processed in attribute-as-blocks mode."
  default     = null
}
variable "network_acl_egress" {
  type        = any
  description = "(Optional) Specifies an egress rule. Parameters defined below. This argument is processed in attribute-as-blocks mode."
  default     = null
}
#---------------------------------------------------
# AWS Network_ACL rule var
#---------------------------------------------------

variable "network_acl_rule_enable" {
  type        = bool
  description = "(Required) Whether creat Network ACL or not"
  default     = false
}
variable "network_acl_rule_network_acl_id" {
  type        = string
  description = "(Required) The ID of the network ACL."
  default     = ""
}
variable "network_acl_rule_rule_number" {
  type        = number
  description = "(Required) The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number."
  default     = 100
}
variable "network_acl_rule_egress" {
  type        = bool
  description = "(Optional, bool) Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet). Default `false`."
  default     = false
}
variable "network_acl_rule_protocol" {
  type        = string
  description = "(Required) The protocol. A value of -1 means all protocols."
  default     = null
}
variable "network_acl_rule_rule_action" {
  type        = string
  description = "(Required) Indicates whether to allow or deny the traffic that matches the rule. Accepted values: `allow` | `deny`"
  default     = "deny"
}
variable "network_acl_rule_cidr_block" {
  type        = string
  description = "(Optional) The network range to allow or deny, in CIDR notation (for example 172.16.0.0/24 )."
  default     = null
}
variable "network_acl_rule_ipv6_cidr_block" {
  type        = string
  description = "(Optional) The IPv6 CIDR block to allow or deny."
  default     = null
}
variable "network_acl_rule_from_port" {
  type        = string
  description = "(Optional) The from port to match."
  default     = null
}
variable "network_acl_rule_to_port" {
  type        = string
  description = "(Optional) The to port to match."
  default     = null
}
variable "network_acl_rule_icmp_type" {
  type        = string
  description = "(Optional) ICMP protocol: The ICMP type. Required if specifying ICMP for the protocolE.g., -1"
  default     = null
}
variable "network_acl_rule_icmp_code" {
  type        = string
  description = "(Optional) ICMP protocol: The ICMP code. Required if specifying ICMP for the protocolE.g., -1"
  default     = null
}
#---------------------------------------------------
# AWS Network_ACL association var
#---------------------------------------------------


variable "network_acl_association_enable" {
  type        = bool
  description = "Required) Whether creat Network ACL or not"
  default     = false
}
variable "network_acl_association_network_acl_id" {
  type        = string
  description = "(Required) The ID of the network ACL."
  default     = ""
}
variable "network_acl_association_subnet_id" {
  type        = string
  description = "(Required) The ID of the associated Subnet."
  default     = ""
}









#--------------------------------------------------------------------------------------------------
#---------------------------------------------------
# AWS Security Group Variables
#---------------------------------------------------

variable "security_group_enable" {
  type        = bool
  description = "(Required) Whether creat Security group or not"
  default     = false
}
variable "security_group_vpc_id" {
  type        = string
  description = "(Optional, Forces new resource) VPC ID. Defaults to the region's default VPC."
  default     = null
}
variable "security_group_name" {
  type        = string
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name."
  default     = null
}
variable "security_group_description" {
  type        = string
  description = "(Optional, Forces new resource) Security group description. Defaults to Managed by Terraform. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags"
  default     = "description"
}


variable "security_group_egress" {
  type        = any
  description = "(Optional, VPC only) Configuration block for egress rules. Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in attribute-as-blocks mode."
  default     = null
}
variable "security_group_ingress" {
  type        = any
  description = "(Optional) Configuration block for ingress rules. Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in attribute-as-blocks mode."
  default     = null
}


variable "security_group_name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}
variable "security_group_revoke_rules_on_delete" {
  type        = bool
  description = " (Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false."
  default     = false
}


variable "security_group_tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider"
  default     = {}
}


#---------------------------------------------------
# AWS Security Group rule Variables
#---------------------------------------------------
variable "security_group_rule_enable" {
  type        = bool
  description = "(Required) Whether creat Security group rule or not"
  default     = false
}


variable "security_group_rule_security_group_id" {
  type        = string
  description = "(Required) Security group to apply this rule to."
  default     = ""
}
variable "security_group_rule_type" {
  type        = string
  description = "(Required) Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  default     = "" # ingress | egress
}


variable "security_group_rule_from_port" {
  type        = string
  description = "(Required) Start port (or ICMP type number if protocol is 'icmp' or 'icmpv6')."
  default     = ""
}
variable "security_group_rule_to_port" {
  type        = string
  description = "(Required) End port (or ICMP code if protocol is 'icmp')."
  default     = ""
}

variable "security_group_rule_protocol" {
  type        = string
  description = "(Required) Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
  default     = ""
}

#----------------|The following arguments are optional:|--------------------
variable "security_group_rule_cidr_blocks" {
  type        = any
  description = "(Optional) List of CIDR blocks. Cannot be specified with source_security_group_id or self."
  default     = null
}
variable "security_group_rule_description" {
  type        = string
  description = "(Optional) Description of the rule."
  default     = null
}
variable "security_group_rule_ipv6_cidr_blocks" {
  type        = any
  description = "(Optional) List of IPv6 CIDR blocks. Cannot be specified with source_security_group_id or self."
  default     = null
}
variable "security_group_rule_prefix_list_ids" {
  type        = any
  description = "(Optional) List of Prefix List IDs."
  default     = null
}
variable "security_group_rule_self" {
  type        = string
  description = "(Optional) Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id."
  default     = null
}
variable "security_group_rule_source_security_group_id" {
  type        = string
  description = "(Optional) Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self."
  default     = null
}
