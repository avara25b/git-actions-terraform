locals {
  vpc_cidr = "${var.vpc_cidr_prefix}.0.0/16"
  subnet1_cidr = "${var.vpc_cidr_prefix}.11.0/24"
  subnet2_cidr = "${var.vpc_cidr_prefix}.12.0/24"
  subnet3_cidr = "${var.vpc_cidr_prefix}.13.0/24"
  subnet1_zone = "us-east-1a"
  subnet2_zone = "us-east-1b"
  subnet3_zone = "us-east-1c"
  subnet1_tag  = "${var.project_name}-${var.environment}-public-subnet-1"
  subnet2_tag  = "${var.project_name}-${var.environment}-public-subnet-2"
  subnet3_tag  = "${var.project_name}-${var.environment}-public-subnet-3"
  igw_tag      = "${var.project_name}-${var.environment}-igw"
  rt_tag       = "${var.project_name}-${var.environment}-public-rt"
}