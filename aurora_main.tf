# Main 🦁
module "aurora_clusters" {
  source              = "./modules/aurora_cluster"
  environment         = var.environment
  cluster_definitions = var.cluster_definitions
}

# Variables 🦊
# variable "environment" {
#   description = "Environment for the clusters"
#   type        = string
#   default     = "dev"
# }


variable "cluster_definitions" {
  description = "Map of cluster identifiers to their configuration"
  type        = map(object({
    database_name       = string
    engine              = string
    engine_version      = string
    master_username     = string
    master_password     = string
    subnet_group        = string
    security_group_ids  = list(string)
    parameter_group     = string
  }))
  default = {
    "cluster1" = {
      database_name       = "db1"
      engine              = "aurora-mysql"
      engine_version      = "5.7.mysql_aurora.2.03.2"
      master_username     = "admin1"
      master_password     = "password1"
      subnet_group        = "subnet-group-1"
      security_group_ids  = ["sg-12345678"]
      parameter_group     = "default.aurora-mysql5.7"
    },
    "cluster2" = {
      database_name       = "db2"
      engine              = "aurora-postgresql"
      engine_version      = "11.9.postgresql_aurora.2.03.2"
      master_username     = "admin2"
      master_password     = "password2"
      subnet_group        = "subnet-group-2"
      security_group_ids  = ["sg-87654321"]
      parameter_group     = "default.aurora-postgresql11.9"
    }
  }
}

# Outputs 🐵
output "cluster_endpoints" {
  value = module.aurora_clusters.cluster_endpoints
}

output "cluster_reader_endpoints" {
  value = module.aurora_clusters.cluster_reader_endpoints
}

