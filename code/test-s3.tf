provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "test_s3" {
  bucket_prefix = "dev-"
  acl           = "public-read-write"


resource "aws_s3_bucket_ownership_controls" "test_s3_boc" {
  bucket = aws_s3_bucket.test_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
