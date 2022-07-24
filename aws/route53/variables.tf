variable "home-ip" {
  description = "Public IP address of home network"
  default = "70.93.179.146"
}

variable "ttl" {
  description = "Default time to live in seconds"
  default = 300
}

variable "public-sites" {
  description = "Map of public sites and their ips"
  default = {
  }
}
