resource "aws_s3_bucket" "simple_bucket" {
  bucket = "my-simple-bucket-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "Simple S3 Bucket"
    Environment = "Dev"
  }
}

data "aws_caller_identity" "current" {}
