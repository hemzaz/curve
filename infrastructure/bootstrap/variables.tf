variable "aws_region" {
  description = "The AWS region to deploy resources in."
  default     = "us-west-2"
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket for Terraform state storage."
  default     = "my-terraform-state-bucket"
}

variable "terraform_locks_name" {
  description = "The name of the DynamoDB table for Terraform state locks."
  default     = "terraform-up-and-running-locks"
}
