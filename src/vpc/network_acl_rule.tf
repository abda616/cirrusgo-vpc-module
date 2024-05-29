resource "aws_network_acl_rule" "this" {
  count = var.network_acl_rule_enable ? 1 : 0

  network_acl_id = var.network_acl_rule_network_acl_id
  rule_number    = var.network_acl_rule_rule_number
  rule_action    = var.network_acl_rule_rule_action
  egress         = var.network_acl_rule_egress

  cidr_block      = var.network_acl_rule_cidr_block
  ipv6_cidr_block = var.network_acl_rule_ipv6_cidr_block

  from_port = var.network_acl_rule_from_port
  to_port   = var.network_acl_rule_to_port

  protocol  = var.network_acl_rule_protocol
  icmp_type = var.network_acl_rule_icmp_type
  icmp_code = var.network_acl_rule_icmp_code
}
