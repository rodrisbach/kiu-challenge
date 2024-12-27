# General
project_name = "kiu_challenge"
environment  = "development"
domain       = "kiusys.com"
# VPC
vpc_cidr         = "10.0.0.0/16"
private_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
public_subnets   = ["10.0.10.0/24", "10.0.11.0/24"]
database_subnets = ["10.0.20.0/24", "10.0.21.0/24"]
# Database
engine                         = "aurora-postgresql"
engine_version                 = "14.7"
instance_class                 = "db.t4g.large"
parameter_group_family         = "aurora-postgresql14"
cluster_parameter_group_family = "aurora-postgresql14"
# Kubernetes
kubernetes_instance_types = ["t3.small"]
# Kubernetes deployment
image = "nginx:1.21.6"
