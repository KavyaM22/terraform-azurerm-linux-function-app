output "id" {
  description = "Function App Resource ID"
  value       = azurerm_linux_function_app.this.id
}

output "name" {
  description = "Function App Name"
  value       = azurerm_linux_function_app.this.name
}

output "principal_id" {
  description = "System Assigned Managed Identity Principal ID"
  value       = azurerm_linux_function_app.this.identity[0].principal_id
}

output "default_hostname" {
  description = "Default Function App URL"
  value       = azurerm_linux_function_app.this.default_hostname
}