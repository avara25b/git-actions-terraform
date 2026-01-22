buckets                   = ["s3-storage-for-images", "s3-storage-for-videos"]
tags                      = "s3-bucket"
envs                      = "dev-env"
bucket_versioning_enabled = "Disabled"
eks_cluster_name          = "dev-eks-cluster"
eks_cluster_version       = "1.34"
eks_ec2_instance_types    = ["t3.medium"]
eks_asg_desired_size      = 2
eks_asg_max_size          = 5
eks_asg_min_size          = 1
eks_admin_principal_arn   = "arn:aws:iam::505789305843:role/admin_access_role"

vpc_cidr_prefix_dev = "10.0"
project_name_dev    = "project-x"
environment_dev     = "dev"

# RDS Module Variables
cluster_identifier      = "projectx_rds_aurora_cluster"
engine                  = "aurora-mysql"
engine_version          = "8.0.mysql_aurora.3.10.3"
availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
database_name           = "mydb-projectx"
master_username         = "admin"
backup_retention_period = 5
preferred_backup_window = "07:00-09:00"
instance_class          = "db.t3.medium"