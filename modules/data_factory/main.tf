resource "azurerm_data_factory" "this" {
  for_each = var.data_factories
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  public_network_enabled = each.value.public_network_enabled
  managed_virtual_network_enabled = each.value.managed_virtual_network_enabled
  tags = var.tags
  
  # Creates a managed identity for the Azure Data Factory, allowing it to securely access Azure resources without storing credentials.
  identity {
    type = "SystemAssigned"
  }
  
  dynamic "github_configuration" {
    for_each = each.value.github_configuration == null ? [] : [each.value.github_configuration]

    content {
      account_name = github_configuration.value.account_name
      branch_name = github_configuration.value.branch_name
      git_url = github_configuration.value.git_url
      repository_name = github_configuration.value.repository_name
      root_folder = github_configuration.value.root_folder
    }
  }
}