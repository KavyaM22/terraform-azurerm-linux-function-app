variable "tags" {
  description = "Tags applied to all Synapse Workspaces"
  type        = map(string)
  default     = {}
}

variable "synapse_workspaces" {
  description = "Map of Synapse Workspaces"

  type = map(object({
    name = string
    resource_group_name = string
    location = string
    storage_data_lake_gen2_filesystem_id = string
    sql_administrator_login = string
    sql_administrator_login_password = string
    managed_virtual_network_enabled = bool
    public_network_access_enabled = bool
    data_exfiltration_protection_enabled = bool
  }))
}