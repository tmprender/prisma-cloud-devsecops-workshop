provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "cabb10fb-2d86-4be6-9e83-ce05d266c0a9"
    git_commit           = "eee81b297f6c54f5840c829a507d363e41fb5d62"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2025-06-11 16:26:51"
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
