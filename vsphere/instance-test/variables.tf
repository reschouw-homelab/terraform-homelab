variable "hostname" {
  default = "terraform-test"
}

variable "address" {
  # Format as x.x.x.x/x
  default = "192.168.1.254/24"
}

variable "gateway" {
  default = "192.168.1.1"
}

variable "dns-servers" {
  # Comma-delimited list of IP addresses
  default = "192.168.1.11, 192.168.1.12"
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
  # In Gigabytes (Minimum of 8GB)
  default = 8
}

variable "domain" {
  default = "dorwinia.com"
}
