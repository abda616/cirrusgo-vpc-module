resource "aws_nat_gateway" "this" {
  count = var.nat_gateway_enable ? 1 : 0

  subnet_id  = var.nat_gateway_subnet_id  # public subnet id
  private_ip = var.nat_gateway_private_ip # optional will be alocated in the public subnet

  #-----------|requeerd if puplic nat and need EIP|-----------
  connectivity_type = var.nat_gateway_connectivity_type # public | private
  allocation_id     = var.nat_gateway_allocation_id     # need EIP

  #-----------|secondary_private_IPs|-----------
  secondary_private_ip_address_count = var.nat_gateway_secondary_private_ip_address_count
  secondary_allocation_ids           = var.nat_gateway_secondary_allocation_ids
  secondary_private_ip_addresses     = var.nat_gateway_secondary_private_ip_addresses

  #-----------|tags|-----------
  tags = var.nat_gateway_tags
}
