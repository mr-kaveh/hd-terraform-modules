resource "aws_s3_bucket" "public_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = var.tags
}

# Disable S3 public access block to allow public bucket policies and ACLs
resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# (Optional) Bucket policy to allow public read access on objects
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.this.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:GetObject"
        ]
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}
