resource "aws_subnet" "private_subnet" {
    count = "${length(var.aws_availability_zone)}"
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${element(var.aws_availability_zone, count.index)}"
    tags = { 
        Name =   "${format("%s%s%s",var.environment, "-private_subnet-", "${element(var.aws_availability_zone, count.index)}")}"
    }
}