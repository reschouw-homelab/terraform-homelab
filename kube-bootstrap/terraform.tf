terraform {
  required_version = "~> 1.13.3"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = " ~> 2.38.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.0.2"
    }
  }

backend "s3" {
    bucket         = "dorwinia-tf-state"
    key            = "kube-bootstrap.tfstate"
    region         = "us-west-2"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}