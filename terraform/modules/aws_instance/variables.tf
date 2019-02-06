variable "environment" {}
variable "instance_type" {}
variable "availability_zone" {}
variable "key_name" {}
variable "vpc_security_group_ids" {type = "list"}
variable "subnet_id" {type = "list"}
variable "ami" {}