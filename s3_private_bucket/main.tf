resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = var.tags
}

# Enable S3 public access block to prevent any public access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
