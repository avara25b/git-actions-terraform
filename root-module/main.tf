module "s3-storage-images" {
  source            = "../s3-module"
  bucket_name       = var.buckets[0]
  tag_name          = var.tags
  env_name          = var.envs
  bucket_versioning = var.bucket_versioning_enabled
}

module "s3-storage-videos" {
  source            = "../s3-module"
  bucket_name       = var.buckets[1]
  tag_name          = var.tags
  env_name          = var.envs
  bucket_versioning = var.bucket_versioning_enabled
}

data "aws_vpc" "eks-vpc" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks-vpc.id]
  }
  filter {
    name = "availability-zone"
    values = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1c",
    ]
  }
}

output "subnet_ids" {
  value = data.aws_subnets.default_subnets.ids
}


module "eks-cluster" {
  # cluster vars
  source          = "../eks-module"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version

  # for default VPC: 
  # subnets = data.aws_subnets.default_subnets.ids

  # for custom VPC:
  subnets             = module.projectx_vpc.subnet_ids
  ec2_instance_types  = var.eks_ec2_instance_types
  asg_desired_size    = var.eks_asg_desired_size
  asg_max_size        = var.eks_asg_max_size
  asg_min_size        = var.eks_asg_min_size
  admin_principal_arn = var.eks_admin_principal_arn
}

module "projectx_vpc" {
  source = "../vpc-module"

  vpc_cidr_prefix = var.vpc_cidr_prefix_dev
  project_name    = var.project_name_dev
  environment     = var.environment_dev
}

module "rds" {
  source = "../rds-module"

  cluster_identifier        = var.cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  availability_zones        = var.availability_zones
  database_name             = var.database_name
  master_username           = var.master_username
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  instance_class            = var.instance_class
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier
}