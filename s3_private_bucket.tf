module "s3_bucket_private" {
    source = "./s3_private_bucket"
    count = 3
    bucket_name = var.bucket_list[count.index]
    # "my-test-${count.index}"
}

variable "bucket_list" {
    description = "list of bucket names"
    type = list(string)
    default = [ "neo", "leo", "teo" ]
  
}