provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "9516e6c5-6ab9-4a4d-b377-e57510634e5e"
    git_commit           = "3e7398611f9e00e42bcc0e84246f9a106f36db25"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2025-05-14 16:29:14"
    git_last_modified_by = "tmprender@gmail.com"
    git_modifiers        = "tmprender"
    git_org              = "tmprender"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
