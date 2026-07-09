# Storage Account
output "storage_account_names" {
  value = module.storage_account.storage_account_names
}

output "storage_account_ids" {
  value = module.storage_account.storage_account_ids
}

output "storage_connection_strings" {
  value     = module.storage_account.primary_connection_strings
  sensitive = true
}

# Log Analytics
output "log_analytics_workspace_name" {
  value = module.log_analytics.name
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.id
}

output "log_analytics_workspace_workspace_id" {
  value = module.log_analytics.workspace_id
}

# Application Insights
output "application_insights_name" {
  value = module.application_insights.name
}

output "application_insights_id" {
  value = module.application_insights.id
}

output "application_insights_connection_string" {
  description = "Application Insights Connection String"
  value       = module.application_insights.connection_string
  sensitive   = true
}

# App Service Plan
output "app_service_plan_name" {
  value = module.app_service_plan.name
}

output "app_service_plan_id" {
  value = module.app_service_plan.id
}

#SQL DB
output "sql_server_name" {
  value = module.sql_server.sql_server_name
}

output "sql_database_name" {
  value = module.sql_server.sql_database_name
}

output "sql_server_id" {
  value = module.sql_server.sql_server_id
}

output "sql_database_id" {
  value = module.sql_server.sql_database_id
}

# Function App
output "function_app_name" {
  value = module.function_app.name
}

output "function_app_id" {
  value = module.function_app.id
}

output "function_app_principal_id" {
  value = module.function_app.principal_id
}

output "function_app_hostname" {
  value = module.function_app.default_hostname
}

# Key Vault
output "key_vault_name" {
  value = module.key_vault.name
}

output "key_vault_id" {
  value = module.key_vault.id
}

output "key_vault_uri" {
  value = module.key_vault.vault_uri
}