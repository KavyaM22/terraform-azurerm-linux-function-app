module "storage_account" {
  source = "./modules/storage_account"
  tags   = var.tags
  storage_accounts = {
    0 = {
      name                            = "devfpsa001"
      resource_group_name             = "Terraform"
      location                        = "Australia East"
      account_tier                    = "Standard"
      account_replication_type        = "LRS"
      account_kind                    = "StorageV2"
      access_tier                     = "Hot"
      is_hns_enabled                  = true
      https_traffic_only_enabled      = true
      min_tls_version                 = "TLS1_2"
      public_network_access_enabled   = true
      allow_nested_items_to_be_public = false
      filesystem_name                 = "synapse"
    }
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

  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

module "sql_db" {

  source = "./modules/sql_db"

  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sql_admin_username = var.sql_admin_username
  sql_admin_password = var.sql_admin_password

  tags = var.tags
}

module "function_app" {

  source = "./modules/function_app"

  environment  = var.environment
  project_name = var.project_name

  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id                          = module.app_service_plan.id
  storage_account_name                     = module.storage_account.storage_account_names["0"]
  storage_account_access_key               = module.storage_account.primary_access_keys["0"]
  application_insights_connection_string   = module.application_insights.connection_string
  application_insights_instrumentation_key = module.application_insights.instrumentation_key

  tags = var.tags
}

module "application_insights" {
  source = "./modules/application_insights"

  environment  = var.environment
  project_name = var.project_name

  resource_group_name = var.resource_group_name
  location            = var.location

  workspace_id = module.log_analytics.id

  tags = var.tags
}

module "role_assignments" {
  source = "./modules/role_assignments"

  # Resource IDs
  storage_account_id         = module.storage_account.storage_account_ids["0"]
  key_vault_id               = module.key_vault.id
  log_analytics_workspace_id = module.log_analytics.id

  # Managed Identities that need access
  principal_ids = {
    function = module.function_app.principal_id
    adf      = module.data_factory.principal_ids["0"]
    synapse  = module.synapse.principal_ids["0"]
  }
}

module "key_vault" {
  source              = "./modules/key_vault"
  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  tags                = var.tags
}

module "synapse" {
  source = "./modules/synapse"
  tags   = var.tags
  synapse_workspaces = {
    0 = {
      name                                 = "devfpsynw001"
      resource_group_name                  = "Terraform"
      location                             = "Australia East"
      storage_data_lake_gen2_filesystem_id = module.storage_account.filesystem_ids["0"]
      sql_administrator_login              = var.sql_admin_username
      sql_administrator_login_password     = var.sql_admin_password
      managed_virtual_network_enabled      = true
      public_network_access_enabled        = true
      data_exfiltration_protection_enabled = false
    }
  }
}

module "data_factory" {
  source = "./modules/data_factory"

  tags = var.tags

  data_factories = {
    0 = {
      name                            = "devfpadf"
      resource_group_name             = "Terraform"
      location                        = "Australia East"
      public_network_enabled          = true
      managed_virtual_network_enabled = false

      github_configuration = {
        account_name    = "KavyaM22"
        branch_name     = "main"
        git_url         = "https://github.com"
        repository_name = "adf-pipelines"
        root_folder     = "/"
      }
    }
  }
}