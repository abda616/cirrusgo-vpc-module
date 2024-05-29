resource "aws_route_table_association" "this" {
  count = var.route_ta_enable ? 1 : 0

  route_table_id = var.route_ta_route_table_id
  subnet_id      = var.route_ta_subnet_id
  gateway_id     = var.route_ta_gateway_id
}
