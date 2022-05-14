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
