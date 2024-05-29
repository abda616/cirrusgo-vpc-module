resource "aws_security_group" "this" {
  count = var.security_group_enable ? 1 : 0

  vpc_id = var.security_group_vpc_id
  name   = var.security_group_name

  description = var.security_group_description
  egress      = var.security_group_egress
  ingress     = var.security_group_ingress

  name_prefix            = var.security_group_name_prefix
  revoke_rules_on_delete = var.security_group_revoke_rules_on_delete

  tags = var.security_group_tags
}
