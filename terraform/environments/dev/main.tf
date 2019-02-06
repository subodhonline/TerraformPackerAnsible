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