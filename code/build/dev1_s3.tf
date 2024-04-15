provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev1_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev1_s3"
    yor_trace            = "758c1b6f-d4de-4e1f-8687-e0449d9b0b07"
    git_commit           = "18ecde76494b44aec89c676bc4ecad9c03061888"
    git_file             = "code/build/dev1_s3.tf"
    git_last_modified_at = "2024-04-15 18:32:31"
    git_last_modified_by = "tmprender@gmail.com"
    git_modifiers        = "tmprender"
    git_org              = "tmprender"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3_boc" {
  bucket = aws_s3_bucket.dev1_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
