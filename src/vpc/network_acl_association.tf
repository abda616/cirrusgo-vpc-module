resource "aws_network_acl_association" "this" {
  count = var.network_acl_association_enable ? 1 : 0

  subnet_id      = var.network_acl_association_subnet_id
  network_acl_id = var.network_acl_association_network_acl_id
}
