resource "aws_rds_cluster" "this" {
  for_each          = var.cluster_definitions
  cluster_identifier = each.key
  engine            = each.value["engine"]
  engine_version    = each.value["engine_version"]
  database_name     = each.value["database_name"]
  master_username   = each.value["master_username"]
  master_password   = each.value["master_password"]
  db_subnet_group_name = each.value["subnet_group"]
  vpc_security_group_ids = each.value["security_group_ids"]

  skip_final_snapshot = true
  deletion_protection = false
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  preferred_maintenance_window = "mon:03:00-mon:04:00"

  tags = {
    Name        = each.key
    Environment = var.environment
  }
}

resource "aws_rds_cluster_instance" "this" {
  for_each          = { for k, v in var.cluster_definitions : "${k}-instance1" => k if true }
  identifier        = "${each.value}-instance1"
  cluster_identifier = each.value
  instance_class    = "db.r5.large"
  engine            = "aurora-mysql"

  db_subnet_group_name = var.cluster_definitions[each.value]["subnet_group"]
  db_parameter_group_name = var.cluster_definitions[each.value]["parameter_group"]
  apply_immediately = true

  tags = {
    Name        = "${each.value}-instance1"
    Environment = var.environment
  }
}
