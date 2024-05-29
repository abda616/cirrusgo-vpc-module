resource "aws_network_acl" "this" {
  count = var.network_acl_enable ? 1 : 0

  vpc_id     = var.network_acl_vpc_id
  subnet_ids = var.network_acl_subnet_ids


  ingress = var.network_acl_ingress
  egress  = var.network_acl_egress

  tags = var.network_acl_tags
}
