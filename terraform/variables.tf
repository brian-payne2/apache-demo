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

variable "ami" {
  description = "AMI to use in building Apache EC2 node"
}

variable "instance_type" {
  description = "Type of instance to launch"
}

variable "user_data" {
  description = "Userdata"
  default     = ""
}

variable "key_name" {
  description = "Keypair to use with Apache EC2 node"
}

variable "apache-iam-role-name" {
  description = "Name for IAM role for Apache EC2 node"
}

variable "ec2-instance-profile" {
  description = "Name for instance profile"
}

variable "subnet_id" {
  description = "Name of subnet to build Apache EC2 node in"
}

variable "state-file-bucket" {
  description = "Bucket name for TF state file"
}

variable "dynamo-db-lock-table" {
  description = "DynamoDB table name for TF state locking"
}

variable "region" {
  description = "Region to create resources"
}