resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  count              = 1
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.rds_cluster.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.rds_cluster.engine
  engine_version     = aws_rds_cluster.rds_cluster.engine_version
}

resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  database_name           = var.database_name
  master_username         = var.master_username
  manage_master_user_password  = true
  master_user_secret_kms_key_id = aws_kms_key.rds.id
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
  db_subnet_group_name    = var.db_subnet_group_name
}

resource "aws_kms_key" "rds" {
  description             = "KMS key for RDS master password"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "rds" {
  name          = "alias/rds-master-password"
  target_key_id = aws_kms_key.rds.id
}