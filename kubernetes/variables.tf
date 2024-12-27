variable "name" {
  type        = string
  description = "Database name"
}

variable "kubernetes_version" {
  type        = string
  description = "Specifies the Kubernetes version"
}

variable "instance_types" {
  type        = list(string)
  description = "Instance type to use at master instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of VPC private subnets CIDR"
}

variable "certificate_arn" {
  type        = string
  description = "The AWS ACM certificate ARN"
}

variable "tags" {
  default = {}
  type    = map(string)
}
