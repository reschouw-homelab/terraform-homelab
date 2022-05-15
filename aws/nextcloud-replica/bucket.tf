resource "aws_s3_bucket" "nextcloud-replica" {
  bucket = "dorwinia-nextcloud-replica"
}

resource "aws_s3_bucket_acl" "nextcloud-replica" {
  bucket = aws_s3_bucket.nextcloud-replica.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "nextcloud-replica" { 
  bucket = aws_s3_bucket.nextcloud-replica.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# Bucket Versioning and Expiration: -------------------------------------------

resource "aws_s3_bucket_versioning" "nextcloud-replica" {
  bucket = aws_s3_bucket.nextcloud-replica.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "nextcloud-replica" {
  bucket = aws_s3_bucket.nextcloud-replica.id
  depends_on = [aws_s3_bucket_versioning.nextcloud-replica]
  rule {
    id = "version-expire"
    status = "Enabled"
    noncurrent_version_expiration {
      noncurrent_days = 7
    }
  }
}

# Bucket Encryption: ----------------------------------------------------------

resource "aws_s3_bucket_server_side_encryption_configuration" "nextcloud-replica" {
  bucket = aws_s3_bucket.nextcloud-replica.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}
