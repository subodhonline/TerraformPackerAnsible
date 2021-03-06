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

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "172.31.1.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "172.31.2.0/24"
}

variable "aws_availability_zone"{
    description = "EC2 availability zone for the subnet"
    default = ["us-east-1a", "us-east-1b"]
}

variable "allow_all_ip" {
    description = "CIDR for the all ip allowed"
    default = "0.0.0.0/0"
}


variable "instance_type" {
    default = "t2.micro"
}

variable "availability_zone" {
    default = "us-east-1a"
}

variable "key_name" {
    default = "devopsnew"
}

variable "vpc_security_group_ids" {
    default = ["sg-002ce36821c4b3bcb"]
}

variable "ami" {
    default = "ami-077251f971bebe3de"
}