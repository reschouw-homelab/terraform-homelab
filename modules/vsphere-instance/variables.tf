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
  description = "Static IP to be applied to server. Format as x.x.x.x/x"
  type = string
}

variable "gateway" {
  description = "Default gateway of primary network interface"
  type = string
}

variable "dns-servers" {
  description = "Comma-delimited list of IP addresses to be used as DNS servers"
  type = string
}

variable "num-cpus" {
  description = "Number of CPU cores available to the instance"
  type = number
}

variable "memory" {
  description = "Amount of RAM dedicated to the instance in MB"
  type = number
}

variable "disk-size" {
  description = "Size of the instance's primary disk in Gigabytes (Minimum of 8GB)"
  type = number
}

variable "datastore" {
  description = "Name of the datastore to house the instance"
  type = string
  default = "esxi-1-local"
}

variable "playbook" {
  description = "Name of the Ansible playbook to be run against the machine on first boot (don't forget the .yml)"
  type = string
  default = "common.yml"
}

variable "template" {
  description = "Name of template to be used as base image"
  type = string
}
