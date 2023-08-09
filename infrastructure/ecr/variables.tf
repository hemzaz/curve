variable "k8s_secret_name" {
  description = "The name of the Kubernetes secret for ECR authentication."
  default     = "ecr-auth"
}

variable "k8s_secret_type" {
  description = "The type of the Kubernetes secret for ECR authentication."
  default     = "kubernetes.io/dockerconfigjson"
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  default     = "xhost-app"
}
