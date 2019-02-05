resource "aws_subnet" "public_subnet" {
    count = "${length(var.aws_availability_zone)}"
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.public_subnet_cidr}"
    map_public_ip_on_launch = true                  #Means that any instance created in this subnet will have a public IP
    availability_zone = "${element(var.aws_availability_zone, count.index)}"
    tags = { 
        Name =   "${format("%s%s%s",var.environment, "-public_subnet-", "${element(var.aws_availability_zone, count.index)}")}"
    }
}