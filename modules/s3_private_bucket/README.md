# S3 Private Bucket Terraform Module

This Terraform module creates an S3 bucket with **private access** enabled. The module ensures that no public access is allowed by:

- Creating an S3 bucket with a configurable name and ACL (default is `private`).
- Enabling the S3 bucket public access block settings to prevent any public ACLs or bucket policies from granting public access.

## Usage

Include this module in your Terraform configuration as follows:

```hcl
module "s3_private_bucket" {
  source      = "./s3_private_bucket"  # Adjust the path as needed
  bucket_name = "my-private-bucket"
  acl         = "private"              # The default value is "private"
  tags = {
    Environment = "dev"
    Project     = "MyProject"
  }
}
