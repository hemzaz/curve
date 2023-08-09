variable "key_name" {
  description = "The key name to use for the instance"
  default     = "my-key"
}
variable "terraform_state_bucket" {
  description = "The name of the S3 bucket for Terraform state storage."
  default     = "my-terraform-state-bucket"
}

variable "terraform_state_key" {
  description = "The key path for Terraform state storage in the S3 bucket."
  default     = "path/to/my/key"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  default     = "us-west-2"
}

variable "terraform_locks_name" {
  description = "The name of the DynamoDB table for Terraform state locks."
  default     = "terraform-up-and-running-locks"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  default     = "my-cluster"
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster."
  default     = "1.17"
}

variable "eks_node_instance_type" {
  description = "The instance type for the EKS nodes."
  default     = "t2.micro"
}

variable "eks_node_desired_capacity" {
  description = "The desired number of nodes in the EKS node group."
  default     = 2
}

variable "eks_node_max_capacity" {
  description = "The maximum number of nodes in the EKS node group."
  default     = 3
}

variable "eks_node_min_capacity" {
  description = "The minimum number of nodes in the EKS node group."
  default     = 1
}

variable "eks_db_node_instance_type" {
  description = "The instance type for the EKS db nodes."
  default     = "t2.micro"
}

variable "eks_db_node_desired_capacity" {
  description = "The desired number of db nodes in the EKS node group."
  default     = 1
}

variable "eks_db_node_max_capacity" {
  description = "The maximum number of db nodes in the EKS node group."
  default     = 2
}

variable "eks_db_node_min_capacity" {
  description = "The minimum number of db nodes in the EKS node group."
  default     = 1
}
