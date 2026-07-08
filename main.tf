module "storage_account" {
  source = "./modules/storage_account"

  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "log_analytics" {
  source = "./modules/log_analytics"

  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags

}

module "app_service_plan" {
  source = "./modules/app_service_plan"

  environment       = var.environment
  project_name      = var.project_name
  resource_group_name = var.resource_group_name
  location          = var.location

  tags = var.tags
}

module "sql_server" {

  source = "./modules/sql_server"

  environment       = var.environment
  project_name      = var.project_name
  resource_group_name = var.resource_group_name
  location          = var.location

  sql_admin_password = var.sql_admin_password

  tags = var.tags
}

module "application_insights" {
  source = "./modules/application_insights"

  environment = var.environment
  project_name = var.project_name

  resource_group_name = var.resource_group_name
  location            = var.location

  workspace_id = module.log_analytics.id

  tags = var.tags
}

