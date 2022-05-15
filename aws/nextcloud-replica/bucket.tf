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

resource "aws_s3_bucket_server_side_encryption_configuration" "nextcloud-replica" {
  bucket = aws_s3_bucket.nextcloud-replica.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}
