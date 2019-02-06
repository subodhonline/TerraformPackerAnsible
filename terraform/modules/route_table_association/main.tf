resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = "${element(var.public_subnet_id, count.index)}"
    route_table_id = "${var.main_route_table_id}"
}

resource "aws_route_table_association" "private_subnet_association" {
    subnet_id = "${element(var.private_subnet_id, count.index)}"
    route_table_id = "${element(var.private_route_table_ids, count.index)}"
}