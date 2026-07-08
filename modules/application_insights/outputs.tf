output "id" {
  description = "Application Insights Resource ID"

  value = azurerm_application_insights.this.id
}

output "name" {
  description = "Application Insights Name"

  value = azurerm_application_insights.this.name
}

output "instrumentation_key" {
  description = "Instrumentation Key"

  value     = azurerm_application_insights.this.instrumentation_key
  sensitive = true
}

output "connection_string" {
  description = "Application Insights Connection String"

  value     = azurerm_application_insights.this.connection_string
  sensitive = true
}