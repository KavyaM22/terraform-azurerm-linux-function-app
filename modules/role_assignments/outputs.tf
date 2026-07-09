output "storage_blob_role_assignment_id" {
  value = azurerm_role_assignment.storage_blob_data_contributor.id
}

output "key_vault_role_assignment_id" {
  value = azurerm_role_assignment.key_vault_secrets_user.id
}

output "monitoring_reader_role_assignment_id" {
  value = azurerm_role_assignment.monitoring_reader.id
}