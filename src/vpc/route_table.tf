resource "aws_route_table" "this" {
  count = var.route_table_enable ? 1 : 0

  vpc_id           = var.route_table_vpc_id
  route            = var.route_table_route
  propagating_vgws = var.route_table_propagating_vgws
  tags             = var.route_table_tags
  /*route {
      one of the apove = value
      one of the bottom = value
    }*/

}
