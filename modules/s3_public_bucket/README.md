# S3 Public Bucket Terraform Module

This Terraform module creates an S3 bucket with public access enabled. It does this by:

- Creating an S3 bucket with a configurable name and ACL.
- Disabling the S3 public access block settings so that public policies and ACLs can be applied.
- (Optional) Attaching a bucket policy to allow public read access on objects.

## Usage

Include this module in your Terraform configuration as follows:

```hcl
module "s3_public_bucket" {
  source      = "./s3_public_bucket"  # Adjust the path as needed
  bucket_name = "my-public-bucket"
  acl         = "public-read"         # or another ACL as needed
  tags = {
    Environment = "dev"
    Project     = "MyProject"
  }
}
