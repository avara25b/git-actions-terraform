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