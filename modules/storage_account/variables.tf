variable "tags" {
  description = "Tags applied to all storage accounts"
  type        = map(string)
  default     = {}
}

variable "storage_accounts" {
  description = "Storage Account configuration"
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    account_tier = string
    account_replication_type = string
    account_kind = string
    access_tier = string
    https_traffic_only_enabled = bool
    min_tls_version = string
    public_network_access_enabled = bool
    allow_nested_items_to_be_public = bool
    container_name = string
  }))
}