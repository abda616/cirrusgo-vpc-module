resource "aws_security_group_rule" "this" {
  count = var.security_group_rule_enable ? 1 : 0

  security_group_id = var.security_group_rule_security_group_id
  type              = var.security_group_rule_type

  from_port = var.security_group_rule_from_port
  to_port   = var.security_group_rule_to_port
  protocol  = var.security_group_rule_protocol

  cidr_blocks              = var.security_group_rule_cidr_blocks
  description              = var.security_group_rule_description
  ipv6_cidr_blocks         = var.security_group_rule_ipv6_cidr_blocks
  prefix_list_ids          = var.security_group_rule_prefix_list_ids
  self                     = var.security_group_rule_self
  source_security_group_id = var.security_group_rule_source_security_group_id
}
