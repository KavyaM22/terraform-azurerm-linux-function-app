output "storage_blob_role_assignment_ids" {
  value = {
    for key, role in azurerm_role_assignment.storage_blob_data_contributor :
    key => role.id
  }
}

output "key_vault_role_assignment_ids" {
  value = {
    for key, role in azurerm_role_assignment.key_vault_secrets_user :
    key => role.id
  }
}

output "monitoring_reader_role_assignment_ids" {
  value = {
    for key, role in azurerm_role_assignment.monitoring_reader :
    key => role.id
  }
}