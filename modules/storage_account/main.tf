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

  # Replication Type
  account_replication_type = each.value.account_replication_type

  # Storage Kind
  account_kind = each.value.account_kind

  # Access Tier
  access_tier = each.value.access_tier

  # HTTPS Only
  https_traffic_only_enabled = each.value.https_traffic_only_enabled

  # Minimum TLS Version
  min_tls_version = each.value.min_tls_version

  # Public Network Access
  public_network_access_enabled = each.value.public_network_access_enabled

  # Prevent Public Blob Access
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public

  # Common Tags
  tags = var.tags
}

resource "azurerm_storage_container" "this" {
  for_each = var.storage_accounts
  name = each.value.container_name
  storage_account_id = azurerm_storage_account.this[each.key].id
  container_access_type = "private"
}