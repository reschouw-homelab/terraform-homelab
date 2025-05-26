# nextcloud user policy: ------------------------------------------------------

resource "aws_iam_user_policy_attachment" "nextcloud" {
  user       = data.aws_iam_user.nextcloud.user_name
  policy_arn = aws_iam_policy.nextcloud-user.arn
}

resource "aws_iam_policy" "nextcloud-user" {
  name = "nextcloud-s3-permisisons"
  policy = data.aws_iam_policy_document.nextcloud-user.json
}

data "aws_iam_policy_document" "nextcloud-user" {
  statement {
    sid = "nextcloudUserObjectPerms"
    actions = ["s3:*"]
    resources = [
      "${aws_s3_bucket.nextcloud.arn}",
      "${aws_s3_bucket.nextcloud.arn}/*",
    ]
  }
  statement {
    sid = "nextcloudUserBucketPerms"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]
    resources = [
      "arn:aws:s3:::*"
    ]
  }
  statement {
    sid = "nextcloudKms"
    actions = [
      "kms:Decrypt",
      "kms:Eecrypt",
      "kms:GenerateDataKey"
    ]
    resources = ["${aws_kms_key.nextcloud.arn}"]
    effect = "Allow"
  }
}

# replication IAM configuration: ----------------------------------------------

resource "aws_iam_role" "nextcloud-replication" {
  name = "nextcloud-replication"
  assume_role_policy = data.aws_iam_policy_document.nextcloud-replication-assume.json
}

data "aws_iam_policy_document" "nextcloud-replication-assume" {
  statement {
    sid = "allowAssume"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "nextcloud-replication" {
  role       = aws_iam_role.nextcloud-replication.name
  policy_arn = aws_iam_policy.nextcloud-replication.arn
}

resource "aws_iam_policy" "nextcloud-replication" {
  name = "nextcloud-replication"
  policy = data.aws_iam_policy_document.nextcloud-replication.json
}

data "aws_iam_policy_document" "nextcloud-replication" {
  statement {
    sid = "listBuckets"
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket"
    ]
    resources = ["${aws_s3_bucket.nextcloud.arn}"]
    effect = "Allow"
  }

  statement {
    sid = "getObjects"
    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging"
    ]
    resources = ["${aws_s3_bucket.nextcloud.arn}/*"]
    effect = "Allow"
  }

  statement {
    sid = "replicateObjects"
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
      #"s3:GetObjectVersionTagging"
    ]
    resources = ["arn:aws:s3:::dorwinia-nextcloud-replica/*"]
    effect = "Allow"
  }

  statement {
    sid = "sourceKmsKey"
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    resources = ["${aws_kms_key.nextcloud.arn}"]
    effect = "Allow"
  }

  statement {
    sid = "destinationKmsKey"
    actions = [
      "kms:Eecrypt",
      "kms:GenerateDataKey"
    ]
    resources = ["arn:aws:kms:us-east-2:841800532843:alias/aws/s3"]
    effect = "Allow"
  }

}

