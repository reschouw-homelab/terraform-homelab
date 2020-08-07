data "aws_secretsmanager_secret_version" "vcenter-creds" {
  secret_id = "vcenter-creds"
}

locals {
  vcenter-creds = jsondecode(
    data.aws_secretsmanager_secret_version.vcenter-creds.secret_string
  )
}
