terraform {
  required_version = "~> 1.13.3"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = " ~> 2.38.0"
    }
  }

backend "s3" {
    bucket         = "dorwinia-tf-state"
    key            = "kube-bootstrap.tfstate"
    region         = "us-west-2"
  }
}

provider "kubernetes" {
  client_certificate     = file("~/.kube/client_certificate")
  client_key             = file("~/.kube/client_key")
  cluster_ca_certificate = file("~/.kube/cluster_ca_certificate")
  host                   = file("~/.kube/host")
}