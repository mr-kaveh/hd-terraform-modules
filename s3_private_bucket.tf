# Uses count expression to create 3 S3 buckets
module "s3_bucket_private" {
    source = "./modules/s3_private_bucket"
    count = 3
    bucket_name = var.bucket_list[count.index]
}

variable "bucket_list" {
    description = "list of bucket names"
    type = list(string)
    default = [ "neo", "leo", "teo" ]
  
}