variable "hostname" {
  default = "terraform-test"
}

variable "playbook" {
  default = "cloud-init-test.yml"
}

variable "num-cpus" {
  default = 2
}

variable "memory" {
  # In Megabytes
  default = 2048
}

variable "disk-size" {
  # In Gigabytes
  # Minimum 8 Gigs
  default = 8
}

variable "domain" {
  default = "dorwinia.com"
}
