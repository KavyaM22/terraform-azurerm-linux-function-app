output "id" {
  description = "Log Analytics Workspace Resource ID"
  value       = azurerm_log_analytics_workspace.this.id
}

output "name" {
  description = "Log Analytics Workspace Name"
  value       = azurerm_log_analytics_workspace.this.name
}

output "workspace_id" {
  description = "Workspace ID"
  value       = azurerm_log_analytics_workspace.this.workspace_id
}