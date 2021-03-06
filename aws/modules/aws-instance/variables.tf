#
# Required Variables: ------------------------------------------------------------
#

variable "hostname" {
  description = "Hostname to be applied to server"
  type = string
}

variable "subnet" {
  description = "Destination subnet"
  type = string
}

#
# Hostname Configuration: --------------------------------------------------------
#

variable "domain" {
  description = "Domain of the instance. Combined with Hostname to form FQDN"
  type = string
  default = "dorwinia.com"
}

#
# Instance Configuration: ----------------------------------------------------------
#

variable "spot-instance" {
  description = "Controls whether the instance is created as spot"
  type = bool
  default = true
}

variable "instance-type" {
  description = "Type of instance to create"
  type = string
  default = "t4g.nano"
}

variable "disk-size" {
  description = "Size of the instance's primary disk in Gigabytes (Minimum of 8GB)"
  type = number
  default = 8
}

variable "ami-name" {
  description = "Name of ami to be used as base image. Grabs most recent ami. Supports regex."
  type = string
  default = "ubuntu-20-04-arm-*"
}

#
# Networking Configuration: -------------------------------------------------------------
#

variable "ip-address" {
  description = "Static IP to be applied to server"
  type = string
  default = null
}

variable "associate-public-ip-address" {
  # Use with caution
  # This specifies that a public ip should be associated with the instance, but elastic-ip determines the type of public ip used.
  description = "Whether or not to associate a public ip address with the instance"
  type = bool
  default = false
}

variable "associate-elastic-ip-address" {
  # Use with caution
  # This determines whether or not to use an elastic ip. No effect without associate_public_ip_address=true
  description = "Whether or not to use an elastic ip instead of a basic public ip"
  type = bool
  default = false
}


variable "custom-security-group-ids" {
  description = "List of custom security groups to be added to the instance."
  # See "security-groups" local value to determine what gets used here
  type = list(string)
  default = []
}

variable "source-dest-check" {
  description = "Controls the Source Destination check commonly used when enabling NAT"
  type = bool
  default = true
}

variable "instance-profile" {
  description = "Instance profile to apply"
  type = string
  default = ""
}

#
# Ansible auto-run Configuration: -------------------------------------------------------
#

variable "ansible-playbook" {
  description = "Name of the Ansible playbook to be run against the machine on first boot (don't forget the .yml)"
  type = string
  default = "common.yml"
}

variable "ansible-branch" {
  description = "Name of the ansible branch to use for ansible auto-runs"
  type = string
  default = "master"
}

variable "ansible-groups" {
  description = "List of groups to add the instance to"
  type = list
  default = ["all"]
}
locals {
  ansible-key-id = jsondecode(data.aws_secretsmanager_secret_version.ansible-user-creds.secret_string)["access_key_id"]
  ansible-key-secret = jsondecode(data.aws_secretsmanager_secret_version.ansible-user-creds.secret_string)["secret_access_key"]
}
