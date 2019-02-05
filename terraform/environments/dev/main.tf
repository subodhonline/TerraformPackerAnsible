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