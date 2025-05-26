locals {
  k8s-join-token = jsondecode(data.aws_secretsmanager_secret_version.k8s-join.secret_string)["token"]
  k8s-join-hash  = jsondecode(data.aws_secretsmanager_secret_version.k8s-join.secret_string)["hash"]
}
