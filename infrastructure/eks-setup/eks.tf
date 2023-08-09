module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.17"
  subnets         = [aws_subnet.subnet.id]

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = var.key_name
      subnet_ids    = [aws_subnet.subnet.id]
    }
    eks_db_nodes = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1

      instance_type = "t2.micro"
      key_name      = var.key_name
      subnet_ids    = [aws_subnet.subnet.id]
    }
  }
}