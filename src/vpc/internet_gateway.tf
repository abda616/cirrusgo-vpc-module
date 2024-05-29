resource "aws_internet_gateway" "this" {
  count = var.internet_gateway_enable ? 1 : 0

  vpc_id = var.internet_gateway_vpc_id

  tags = var.internet_gateway_tags
}
