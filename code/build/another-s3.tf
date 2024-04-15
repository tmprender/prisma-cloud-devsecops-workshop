provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev2_s3" {
  bucket_prefix = "dev2-"
  acl           = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev2_s3"
    yor_trace            = "58d570c2-3bf0-4e66-bea2-6819a20423b4"
    git_commit           = "dca1b8fe6423e3e19c87e280368057935e94d9d8"
    git_file             = "code/build/another-s3.tf"
    git_last_modified_at = "2024-04-15 18:00:13"
    git_last_modified_by = "tmprender@gmail.com"
    git_modifiers        = "tmprender"
    git_org              = "tmprender"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev2_s3" {
  bucket = aws_s3_bucket.dev2_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
