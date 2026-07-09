resource "azurerm_storage_account" "this" {

  for_each = var.storage_accounts

  # Storage Account name (must be globally unique)
  name = local.storage_account_names[each.key]

  # Resource Group
  resource_group_name = var.resource_group_name

  # Azure Region
  location = var.location

  # Performance Tier
  account_tier = each.value.account_tier

  # Replication Type (LRS/ZRS/GRS/RAGRS/etc.)
  account_replication_type = each.value.account_replication_type

  # StorageV2 / BlobStorage / FileStorage
  account_kind = each.value.account_kind

  # Hot / Cool
  access_tier = each.value.access_tier

  # Allow only HTTPS traffic
  https_traffic_only_enabled = each.value.https_traffic_only_enabled

  # Minimum TLS version
  min_tls_version = each.value.min_tls_version

  # Public Internet access
  public_network_access_enabled = each.value.public_network_access_enabled

  # Prevent public blob/container access
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public

  # Merge common tags with account-specific tags
  tags = merge(var.tags, each.value.tags)

}

resource "azurerm_storage_container" "this" {

  for_each = var.storage_accounts

  # Blob Container name
  name = each.value.container_name

  # Parent Storage Account
  storage_account_id = azurerm_storage_account.this[each.key].id

  # No anonymous access
  container_access_type = "private"

}