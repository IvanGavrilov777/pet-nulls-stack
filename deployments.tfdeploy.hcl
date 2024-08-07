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

    role_arn            = "arn:aws:iam::459933373272:role/tfc-role"
    identity_token_file = identity_token.aws.jwt_filename
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
