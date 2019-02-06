provider "aws"{
    access_key = "${var.AWS_ACCESS_KEY_ID}"
    secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
    region = "${var.aws_region}"
}

module "vpc" {
  source                                            = "../../modules/vpc"
  environment                                       = "${var.environment}"
  vpc_cidr                                          = "${var.vpc_cidr}"
  enable_dns_hostnames                              = "${var.enable_dns_hostnames}"
  enable_dns_support                                = "${var.enable_dns_support}"
}

module "public_subnet" {
  source                                            = "../../modules/public_subnet"
  environment                                       = "${var.environment}"
  public_subnet_cidr                                = "${var.public_subnet_cidr}"
  aws_availability_zone                             = ["us-east-1a", "us-east-1b"]
  vpc_id                                            = "${module.vpc.vpc_id}"
}

module "private_subnet" {
  source                                            = "../../modules/private_subnet"
  environment                                       = "${var.environment}"
  private_subnet_cidr                               = "${var.private_subnet_cidr}"  
  aws_availability_zone                             = ["us-east-1a", "us-east-1b"]
  vpc_id                                            = "${module.vpc.vpc_id}"
}

module "internet_gateway" {
  source                                            = "../../modules/internet_gateway"
  environment                                       = "${var.environment}"
  vpc_id                                            = "${module.vpc.vpc_id}"
}

module "internet_access" {
  source                                            = "../../modules/internet_access"
  main_route_table_id                               = "${module.vpc.main_route_table_id}"
  allow_all_ip                                      = "${var.allow_all_ip}"
  internet_gateway_id                               = "${module.internet_gateway.internet_gateway_id}"
}

resource "aws_eip" "elastic_ip" {
  vpc      = true                                           #If true, the EIP is in the VPC 
  depends_on = ["module.internet_gateway"]                  #Conditional variable which say in this case the EIP resource should be created after the Internet Gateway is already created
}

resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.elastic_ip.id}"
    subnet_id = "${element(module.private_subnet.private_subnet_id, count.index)}"
    depends_on = ["module.internet_gateway"]
}

module "private_subnet_route_table" {
  source                                            = "../../modules/private_subnet_route_table"
  environment                                       = "${var.environment}"
  vpc_id                                            = "${module.vpc.vpc_id}"
  allow_all_ip                                      = "${var.allow_all_ip}"
  natgw_id                                          = "${aws_nat_gateway.nat.*.id}"
}

module "route_table_association" {
  source                                            = "../../modules/route_table_association"
  public_subnet_id                                  = "${module.public_subnet.public_subnet_id}"
  private_subnet_id                                 = "${module.private_subnet.private_subnet_id}"
  main_route_table_id                               = "${module.vpc.main_route_table_id}"
  private_route_table_ids                           = "${module.private_subnet_route_table.private_route_table_ids}"
}