output "private_subnet_id" {
  description = "List of IDs of private subnets"
  value       = ["${aws_subnet.private_subnet.*.id}"]
}