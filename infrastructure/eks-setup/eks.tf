module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  subnets         = [aws_subnet.subnet.id]

  node_groups = {
    eks_nodes = {
      desired_capacity = var.eks_node_desired_capacity
      max_capacity     = var.eks_node_max_capacity
      min_capacity     = var.eks_node_min_capacity
      instance_type    = var.eks_node_instance_type
      key_name         = var.key_name
      subnet_ids       = [aws_subnet.subnet.id]
    }
    eks_db_nodes = {
      desired_capacity = var.eks_db_node_desired_capacity
      max_capacity     = var.eks_db_node_max_capacity
      min_capacity     = var.eks_db_node_min_capacity
      instance_type    = var.eks_db_node_instance_type
      key_name         = var.key_name
      subnet_ids       = [aws_subnet.subnet.id]
    }
  }
}
