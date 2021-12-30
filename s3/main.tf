terraform {
  backend "local" {
    path = "/tmp/tfstate/terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "first-bucket" {
  bucket_prefix = var.s3_name
  acl           = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Createed_By = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "protect_bucket" {
  bucket = aws_s3_bucket.first-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
