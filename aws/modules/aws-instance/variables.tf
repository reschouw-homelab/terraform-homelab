variable "hostname" {
  description = "Hostname to be applied to server"
  type = string
}

variable "domain" {
  description = "Domain of the instance. Combined with Hostname to form FQDN"
  type = string
  default = "dorwinia.com"
}

variable "ip-address" {
  description = "Static IP to be applied to server"
  type = string
}

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

variable "playbook" {
  description = "Name of the Ansible playbook to be run against the machine on first boot (don't forget the .yml)"
  type = string
  default = "common.yml"
}

variable "ami-name" {
  description = "Name of ami to be used as base image. Grabs most recent ami. Supports regex."
  type = string
  default = "ubuntu-18-04-*"
}
