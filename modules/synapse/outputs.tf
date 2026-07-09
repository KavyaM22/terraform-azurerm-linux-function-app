output "workspace_ids" {
  value = {
    for key, workspace in azurerm_synapse_workspace.this :
    key => workspace.id
  }
}

output "workspace_names" {
  value = {
    for key, workspace in azurerm_synapse_workspace.this :
    key => workspace.name
  }
}

output "workspace_connectivity_endpoints" {
  value = {
    for key, workspace in azurerm_synapse_workspace.this :
    key => workspace.connectivity_endpoints
  }
}