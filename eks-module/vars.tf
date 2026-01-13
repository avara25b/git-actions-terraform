variable "cluster_name" {
    type = string
}

variable "cluster_version" {
    type = string
}

variable "subnets" {
    type = list(string)
}

variable "ec2_instance_types" {
    type = list(string)
}

variable "asg_desired_size" {
    type = number
}

variable "asg_max_size" {
    type = number
}

variable "asg_min_size" {
    type = number
}

variable "admin_principal_arn" {
  type        = string
  description = "IAM role/user ARN to grant EKS cluster admin access"
}