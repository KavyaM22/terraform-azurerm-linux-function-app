resource "azurerm_storage_account" "this" {
  for_each = var.storage_accounts

  # Storage Account Name
  name = each.value.name

  # Resource Group
  resource_group_name = each.value.resource_group_name

  # Azure Region
  location = each.value.location

  # Performance Tier
  account_tier = each.value.account_tier

  # Replication Type (LRS/ZRS/GRS/etc.)
  account_replication_type = each.value.account_replication_type

  # StorageV2
  account_kind = each.value.account_kind

  # Hot/Cool
  access_tier = each.value.access_tier

  # Enable Azure Data Lake Storage Gen2
  is_hns_enabled = each.value.is_hns_enabled

  # Allow only HTTPS
  https_traffic_only_enabled = each.value.https_traffic_only_enabled

  # Minimum TLS Version
  min_tls_version = each.value.min_tls_version

  # Public Network Access
  public_network_access_enabled = each.value.public_network_access_enabled

  # Prevent public blob access
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public

  tags = var.tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "this" {
  for_each = var.storage_accounts

  # Data Lake File System Name
  name = each.value.filesystem_name

  # Parent Storage Account
  storage_account_id = azurerm_storage_account.this[each.key].id
}