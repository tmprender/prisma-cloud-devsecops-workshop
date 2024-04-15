provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev1_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"

  tags = {
    Environment = "Dev"
    yor_name    = "dev1_s3"
    yor_trace   = "758c1b6f-d4de-4e1f-8687-e0449d9b0b07"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3_boc" {
  bucket = aws_s3_bucket.dev1_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
