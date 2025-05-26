variable "az_map" {
  description = "Map of AZ letters and numbers to be used to create subnets"
  type = map(number)
  default = {
    a = 0
    b = 1
    c = 2
    d = 3
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "environment" {
  description = "Environment name for resource tagging"
  type        = string
  default     = "homelab"
}
