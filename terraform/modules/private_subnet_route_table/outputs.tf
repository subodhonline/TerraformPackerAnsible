output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = ["${aws_route_table.private_route_table.*.id}"]
}