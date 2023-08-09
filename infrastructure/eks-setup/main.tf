# infrastructure/eks-setup/main.tf

variable "eks_cluster_name" {}
variable "eks_node_group_name" {}
variable "eks_node_instance_type" {}
variable "eks_node_desired_size" {}
variable "eks_node_max_size" {}
variable "eks_node_min_size" {}