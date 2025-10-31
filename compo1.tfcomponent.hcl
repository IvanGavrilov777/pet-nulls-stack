# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}
##variable "region" {
#  type = string
#}

#variable "identity_token_file" {
#  type = string
#}

#variable "role_arn" {
#  type = string
#}


required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  null = {
    source  = "hashicorp/null"
    version = "~> 3.2.2"
  }

 # aws = {
 #   source = "hashicorp/aws"
 #   version = "5.61.0"
 # }
}

provider "random" "this" {}
provider "null" "this" {}
#provider "aws" "this" {
#config {
#    region = var.region
#    assume_role_with_web_identity {
#      role_arn                = var.role_arn
#      web_identity_token_file = var.identity_token_file
#    }
#}
#}

component "pet" {
  source = "./pet"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
  }
}

component "nulls" {
  source = "./nulls"

  inputs = {
    pet       = component.pet.name
    instances = var.instances
  }

  providers = {
    null = provider.null.this
  }
}

#component "ec2" {
#  source = "./ec2"
#
#  providers = {
#    aws = provider.aws.this
#  }
#}

