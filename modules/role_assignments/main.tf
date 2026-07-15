# Storage Account
resource "azurerm_role_assignment" "storage_blob_data_contributor" {
  for_each = var.principal_ids
  scope = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = each.value
}

# Key Vault
resource "azurerm_role_assignment" "key_vault_secrets_user" {
  for_each = var.principal_ids
  scope = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id = each.value
}

# Log Analytics
resource "azurerm_role_assignment" "monitoring_reader" {
  for_each = var.principal_ids
  scope = var.log_analytics_workspace_id
  role_definition_name = "Monitoring Reader"
  principal_id = each.value
}
