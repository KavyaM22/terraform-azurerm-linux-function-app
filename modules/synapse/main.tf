resource "azurerm_synapse_workspace" "this" {

  for_each = var.synapse_workspaces

  # Workspace Name
  name = each.value.name

  # Resource Group
  resource_group_name = each.value.resource_group_name

  # Azure Region
  location = each.value.location

  # Default ADLS Gen2 File System
  storage_data_lake_gen2_filesystem_id = each.value.storage_data_lake_gen2_filesystem_id

  # SQL Administrator
  sql_administrator_login = each.value.sql_administrator_login

  sql_administrator_login_password = each.value.sql_administrator_login_password

  # Managed Virtual Network
  managed_virtual_network_enabled = each.value.managed_virtual_network_enabled

  # Public Access
  public_network_access_enabled = each.value.public_network_access_enabled

  # Data Exfiltration Protection
  data_exfiltration_protection_enabled = each.value.data_exfiltration_protection_enabled

  # Creates a managed identity for the Azure Synapse Analytics, allowing it to securely access Azure resources without storing credentials.
  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}