resource "aws_s3_bucket" "nextcloud" {
  bucket = "dorwinia-nextcloud"
}

resource "aws_s3_bucket_acl" "nextcloud" {
  bucket = aws_s3_bucket.nextcloud.id
  acl    = "private"
}
