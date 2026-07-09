module "storage_account" {
  source = "./modules/storage_account"
  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  storage_accounts = {
    function = {}
  }
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

module "sql_db" {

  source = "./modules/sql_db"

  environment       = var.environment
  project_name      = var.project_name
  resource_group_name = var.resource_group_name
  location          = var.location

  sql_admin_username  = var.sql_admin_username
  sql_admin_password = var.sql_admin_password

  tags = var.tags
}

module "function_app" {

  source = "./modules/function_app"

  environment = var.environment
  project_name = var.project_name

  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id = module.app_service_plan.id
  storage_account_name = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key
  application_insights_connection_string = module.application_insights.connection_string
  application_insights_instrumentation_key = module.application_insights.instrumentation_key

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

module "role_assignments" {
  source = "./modules/role_assignments"
  function_principal_id = module.function_app.principal_id
  storage_account_id = module.storage_account.storage_account_id
  key_vault_id = module.key_vault.id
  log_analytics_workspace_id = module.log_analytics.id
}

module "key_vault" {
  source = "./modules/key_vault"
  environment = var.environment
  project_name = var.project_name
  resource_group_name = var.resource_group_name
  location = var.location
  tenant_id = var.tenant_id
  tags = var.tags
}
