variable "buckets" {
  type = list(string)
}

variable "tags" {
  type = string
}

variable "envs" {
  type = string
}

variable "bucket_versioning_enabled" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "eks_cluster_version" {
  type = string
}


variable "eks_ec2_instance_types" {
  type = list(string)
}

variable "eks_asg_desired_size" {
  type = number
}

variable "eks_asg_max_size" {
  type = number
}

variable "eks_asg_min_size" {
  type = number
}

variable "eks_admin_principal_arn" {
  type = string
}

variable "vpc_cidr_prefix_dev" {
  type = string
}

variable "project_name_dev" {
  type = string
}

variable "environment_dev" {
  type = string
}

# RDS Module Variables
variable "cluster_identifier" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "availability_zones" {
  type = list(string)
}
variable "database_name" {
  type = string
}
variable "master_username" {
  type = string
}

variable "backup_retention_period" {
  type = number
}
variable "preferred_backup_window" {
  type = string
}
variable "instance_class" {
  type    = string
}