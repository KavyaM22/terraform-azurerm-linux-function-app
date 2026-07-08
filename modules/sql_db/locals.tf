locals {
  sql_server_name = "${var.environment}${var.project_name}-sql01"
  sql_database_name = "${var.environment}${var.project_name}-db"
}