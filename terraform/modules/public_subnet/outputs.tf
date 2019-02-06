output "public_subnet_id" {
  description = "List of IDs of public subnets"
  value       = ["${aws_subnet.public_subnet.*.id}"]
}