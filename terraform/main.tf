terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

provider "aws" {
  region     = "${var.region}"
}