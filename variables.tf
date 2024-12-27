# General

variable "project_name" {
  type        = string
  description = "The common name for all the resources"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "profile" {
  type        = string
  description = "The name of the AWS CLI profile"
  default     = "kiu-challenge"
}

variable "domain" {
  type        = string
  description = "The web domain"
}

# VPC

variable "vpc_cidr" {
  type        = string
  description = "The VPC CIDR"
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of CIDRs for private subnets"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
}

variable "vpc_database_subnets" {
  type        = list(string)
  description = "List of CIDRs for database subnets"
}

# Database

variable "engine" {
  type        = string
  description = "Database engine name"
}

variable "engine_version" {
  type        = string
  description = "Database engine version"
}

variable "instance_class" {
  type        = string
  description = "Database instance class"
}

variable "parameter_group_family" {
  type        = string
  description = "The family of the DB parameter group"
}

variable "cluster_parameter_group_family" {
  type        = string
  description = "The family of the DB cluster parameter group"
}

# Kubernetes deployment

variable "image" {
  type        = string
  description = "The docker image used on the Kubernetes deployment"
}
