variable cluster_identifier {
  type = string
}

variable engine {
  type = string
}

variable engine_version {
  type = string
}

variable availability_zones {
  type = list(string)
}

variable database_name {
  type = string
}

variable master_username {
  type = string
  sensitive = true
}

variable backup_retention_period {
  type = number
}

variable preferred_backup_window {
  type = string
}

variable instance_class {
  type    = string
}

variable skip_final_snapshot {
  type    = bool
}

variable final_snapshot_identifier {
  type    = string
  default = null
}