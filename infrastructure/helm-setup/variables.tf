# infrastructure/helm-setup/variables.tf

variable "app_image_repository" {
  description = "ECR repository URL for the xhost-app"
  type        = string
}

variable "app_image_tag" {
  description = "Image tag for the xhost-app"
  type        = string
  default     = "latest"
}

variable "mongodb_root_password" {
  description = "Root password for MongoDB"
  type        = string
}

variable "mongodb_username" {
  description = "Username for MongoDB"
  type        = string
}

variable "mongodb_password" {
  description = "Password for MongoDB user"
  type        = string
}

variable "mongodb_database" {
  description = "Database name for MongoDB"
  type        = string
}
