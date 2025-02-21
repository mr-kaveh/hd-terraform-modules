output "cluster_endpoints" {
  value = { for k, v in aws_rds_cluster.this : k => v.endpoint }
}

output "cluster_reader_endpoints" {
  value = { for k, v in aws_rds_cluster.this : k => v.reader_endpoint }
}
