resource "aws_route" "internet_access" {
  route_table_id         = "${var.main_route_table_id}"
  destination_cidr_block = "${var.allow_all_ip}"
  gateway_id             = "${var.internet_gateway_id}"
}