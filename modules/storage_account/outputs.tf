output "storage_account_ids" {
  description = "Storage Account IDs"
  value = {
    for key, account in azurerm_storage_account.this :
    key => account.id
  }
}

output "storage_account_names" {
  description = "Storage Account Names"
  value = {
    for key, account in azurerm_storage_account.this :
    key => account.name
  }
}

output "primary_connection_strings" {
  description = "Primary Connection Strings"
  sensitive = true
  value = {
    for key, account in azurerm_storage_account.this :
    key => account.primary_connection_string
  }
}

output "primary_access_keys" {
  sensitive = true
  value = {
    for key, account in azurerm_storage_account.this :
    key => account.primary_access_key
  }
}

output "filesystem_ids" {
  value = {
    for key, filesystem in azurerm_storage_data_lake_gen2_filesystem.this :
    key => filesystem.id
  }
}

output "filesystem_names" {
  value = {
    for key, filesystem in azurerm_storage_data_lake_gen2_filesystem.this :
    key => filesystem.name
  }
}