resource "aws_s3_bucket" "bucket_brainfuck_ide" {
  acl            = "private"
  arn            = "arn:aws:s3:::bucket-brainfuck-ide"
  bucket         = "bucket-brainfuck-ide"
  force_destroy  = false
  region         = "us-east-1"
  request_payer  = "BucketOwner"
  tags           {}

  versioning {
    enabled    = false
    mfa_delete = false
  }

  website {
    index_document = "index.html"
  }

  website_domain   = "s3-website-us-east-1.amazonaws.com"
  website_endpoint = "bucket_brainfuck_ide.s3-website-us-east-1.amazonaws.com"
}
