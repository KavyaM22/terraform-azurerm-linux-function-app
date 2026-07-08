#Storage Account
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

#Log Analytics
output "log_analytics_workspace_name" {
  value = module.log_analytics.name
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.id
}

output "log_analytics_workspace_workspace_id" {
  value = module.log_analytics.workspace_id
}

#Application Insights
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