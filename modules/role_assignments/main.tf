# Storage Account
resource "azurerm_role_assignment" "storage_blob_data_contributor" {
  scope = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = var.function_principal_id
}

# Key Vault
resource "azurerm_role_assignment" "key_vault_secrets_user" {
  scope = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id = var.function_principal_id
}

# Log Analytics
resource "azurerm_role_assignment" "monitoring_reader" {
  scope = var.log_analytics_workspace_id
  role_definition_name = "Monitoring Reader"
  principal_id = var.function_principal_id
}
