module "db" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name                        = var.project_name
  engine                      = var.engine
  engine_version              = var.engine_version
  allow_major_version_upgrade = true
  allocated_storage           = 20
  port                        = var.engine == "mysql" ? 3306 : 5432
  instance_class              = var.instance_class
  instances                   = { 1 = {} }

  master_username                      = "root"
  manage_master_user_password_rotation = false

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
  }

  autoscaling_enabled      = true
  autoscaling_min_capacity = 1
  autoscaling_max_capacity = 5
  autoscaling_target_cpu   = 85

  enabled_cloudwatch_logs_exports = ["general"]
  create_cloudwatch_log_group     = true

  skip_final_snapshot = true
  deletion_protection = true

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  create_db_cluster_parameter_group      = true
  db_cluster_parameter_group_name        = var.project_name
  db_cluster_parameter_group_family      = var.cluster_parameter_group_family
  db_cluster_parameter_group_description = "${var.project_name} cluster parameter group"

  create_db_parameter_group      = true
  db_parameter_group_name        = var.project_name
  db_parameter_group_family      = var.parameter_group_family
  db_parameter_group_description = "${var.project_name} DB parameter group"

  tags = local.tags
}
