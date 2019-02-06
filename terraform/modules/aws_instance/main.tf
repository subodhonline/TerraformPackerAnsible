resource "aws_instance" "instance" {
    count = "${length(var.subnet_id)}"
    ami = "${var.ami}"
    availability_zone = "${var.availability_zone}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = "${var.vpc_security_group_ids}"
    subnet_id = "${element(var.subnet_id, count.index)}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "${var.environment}"
    }
}