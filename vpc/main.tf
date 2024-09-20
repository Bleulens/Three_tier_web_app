terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

  infra_env = var.infra.env
  #Half of ip address space in case vpc peering needed. (Also just experimenting with different things.)
  vpc_cidr = "10.0.0.0/17"
}
