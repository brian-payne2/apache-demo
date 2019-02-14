variable "tags" {
    description = "A map of tags to add to all resources"
    default     = {}
}

variable "publicip" {
    description = "IP to whitelist ingress traffic"
}

variable "sg-name" {
    description = "Name of security group"
}

variable "sg-description" {
  description = "Security group for apache access"
  default     = "Managed by Terraform"
}

variable "vpc_id" {
    description = "ID of the VPC where to create security group"
}

variable "egress_cidr_blocks" {
    description = "CIDR for SG egress traffic"
}
