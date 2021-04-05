#
# Hostname Configuration: --------------------------------------------------------
#

variable "hostname" {
  description = "Hostname to be applied to server"
  type = string
}

variable "domain" {
  description = "Domain of the instance. Combined with Hostname to form FQDN"
  type = string
  default = "dorwinia.com"
}


#
# Instance Size Configuration: ----------------------------------------------------------
#

variable "instance-type" {
  description = "Type of instance to create"
  type = string
  default = "t3a.nano"
}

variable "disk-size" {
  description = "Size of the instance's primary disk in Gigabytes (Minimum of 8GB)"
  type = number
  default = 8
}

variable "ami-name" {
  description = "Name of ami to be used as base image. Grabs most recent ami. Supports regex."
  type = string
  default = "ubuntu-20-04-*"
}

#
# Networking Configuration: -------------------------------------------------------------
#

variable "ip-address" {
  description = "Static IP to be applied to server"
  type = string
}

variable "associate-public-ip" {
  description = "Whether or not to associate a public ip address with the instance"
  type = bool
  default = false
}

variable "custom-security-group-ids" {
  description = "List of custom security groups to be added to the instance."
  # See "security-groups" local value to determine what gets used here
  type = list(string)
  default = []
}

#
# Ansible auto-run Configuration: -------------------------------------------------------
#

variable "playbook" {
  description = "Name of the Ansible playbook to be run against the machine on first boot (don't forget the .yml)"
  type = string
  default = "common.yml"
}

locals {
  ansible-key-id = jsondecode(data.aws_secretsmanager_secret_version.ansible-user-creds.secret_string)["access_key_id"]
  ansible-key-secret = jsondecode(data.aws_secretsmanager_secret_version.ansible-user-creds.secret_string)["secret_access_key"]
}
