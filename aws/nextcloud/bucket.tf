resource "aws_s3_bucket" "nextcloud" {
  bucket = "dorwinia-nextcloud"
}

resource "aws_s3_bucket_acl" "nextcloud" {
  bucket = aws_s3_bucket.nextcloud.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "nextcloud" {
  bucket = aws_s3_bucket.nextcloud.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "nextcloud" {
  bucket = aws_s3_bucket.nextcloud.id
  depends_on = [aws_s3_bucket_versioning.nextcloud]
  rule {
    id = "version-expire"
    status = "Enabled"
    noncurrent_version_expiration {
      noncurrent_days = 60
    }
    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class = "ONEZONE_IA"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "nextcloud" { 
  bucket = aws_s3_bucket.nextcloud.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
