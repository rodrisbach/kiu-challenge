locals {
  region = "us-east-1"
  host   = format("%s.%s", "app", var.domain)
  tags = {
    project     = "${var.project_name}"
    environment = "${var.environment}"
    team        = "DevOps"
  }
}
