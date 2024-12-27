data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}"

  cidr = var.vpc_cidr
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets  = var.vpc_private_subnets
  public_subnets   = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}

module "k8s" {
  source             = "./kubernetes"
  name               = var.project_name
  kubernetes_version = "1.31"
  instance_types     = ["t3.small"]
  vpc_id             = module.vpc.vpc_id
  private_subnets    = module.vpc.private_subnets
  certificate_arn    = aws_acm_certificate.main.arn
  tags               = local.tags
}

module "app" {
  source = "./app"
  name   = var.project_name
  image  = "nginx:1.27.3"
  host   = local.host
  tags   = local.tags
}
