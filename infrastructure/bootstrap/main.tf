provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.terraform_locks_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

