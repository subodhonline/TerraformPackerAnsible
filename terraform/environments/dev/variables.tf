// TF_VAR_AWS_ACCESS_KEY_ID, TF_VAR_AWS_SECRET_ACCESS_KEY is defined in .bashrc file. Using TF_VAR at the begining you can use it in terraform
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}


variable "aws_region"{
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "environment" {
    default = "dev"
}

variable "vpc_cidr" {
    default = "172.31.0.0/16"
}

variable "enable_dns_hostnames" {
    default = true
}

variable "enable_dns_support" {
    default = true
}