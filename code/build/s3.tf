provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"


  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "06d23a7f-1af2-4257-a15e-d453c5f5c02b"
    git_commit           = "ff6fab3dd319c1d895b3abe6f7a7b0107e08d479"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2025-01-21 18:00:43"
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
