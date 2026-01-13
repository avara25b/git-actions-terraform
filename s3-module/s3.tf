resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.tag_name
    Environment = var.env_name
  }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}