resource "aws_route_table" "private_route_table" {
    vpc_id = "${var.vpc_id}"

    tags {
        Name = "${format("%s%s",var.environment, "-private-route-table")}"
    }
}

resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "${var.allow_all_ip}"
	nat_gateway_id = "${var.natgw_id}"
}