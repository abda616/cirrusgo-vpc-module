resource "aws_eip" "this" {
  count = var.eip_enable ? 1 : 0

  domain               = var.eip_domain
  network_border_group = var.eip_network_border_group

  network_interface = var.eip_network_interface
  instance          = var.eip_instance

  address                   = var.eip_address
  associate_with_private_ip = var.eip_associate_with_private_ip
  public_ipv4_pool          = var.eip_public_ipv4_pool
  customer_owned_ipv4_pool  = var.eip_customer_owned_ipv4_pool

  tags = var.eip_tags
}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
