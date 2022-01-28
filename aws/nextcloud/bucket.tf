resource "aws_s3_bucket" "nextcloud" {
  bucket = "dorwinia-nextcloud"
  acl    = "private"
}
