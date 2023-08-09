# infrastructure/eks-setup/main.tf

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "eks_node_group_name" {
  description = "The name of the EKS node group."
  type        = string
}

variable "eks_node_instance_type" {
  description = "The instance type for the EKS nodes."
  type        = string
  default     = "t2.medium"
}

variable "eks_node_desired_size" {
  description = "The desired number of nodes in the EKS node group."
  type        = number
  default     = 2
}

variable "eks_node_max_size" {
  description = "The maximum number of nodes in the EKS node group."
  type        = number
  default     = 3
}

variable "eks_node_min_size" {
  description = "The minimum number of nodes in the EKS node group."
  type        = number
  default     = 1
}
