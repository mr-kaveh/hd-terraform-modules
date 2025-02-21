variable "environment" {
  description = "Environment for the clusters"
  type        = string
}

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
}
