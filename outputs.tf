output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}

output "storage_connection_string" {
  value     = module.storage_account.primary_connection_string
  sensitive = true
}

output "log_analytics_workspace_name" {
  value = module.log_analytics.name
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.id
}

output "log_analytics_workspace_workspace_id" {
  value = module.log_analytics.workspace_id
}