# infrastructure/config.tfvars

# EKS Variables
eks_cluster_name = "my-eks-cluster"
eks_node_group_name = "my-node-group"
eks_node_instance_type = "t2.micro"
eks_node_desired_size = 2
eks_node_max_size = 3
eks_node_min_size = 1

# Helm Variables
app_image_repository = "YOUR_ECR_REPOSITORY_URL"
app_image_tag = "latest"
mongodb_root_password = "secretpassword"
mongodb_username = "my-user"
mongodb_password = "my-password"
mongodb_database = "my-database"