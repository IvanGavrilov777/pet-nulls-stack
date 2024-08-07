# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 1
region = "us-west-1"
  }
}

#deployment "complex" {
#  inputs = {
#    prefix           = "complex"
#    instances        = 3
#  }
#}

#deployment "vancho" {
#  inputs = {
#    prefix           = "complex"
 #   instances        = 3
 # }
#}
