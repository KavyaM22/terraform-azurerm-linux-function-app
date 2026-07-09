variable "environment" {
  description = "Environment"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "resource_group_name" {
  description = "Existing Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all storage accounts"
  type = map(string)
  default = {}
}

variable "storage_accounts" {
  description = "Map of Storage Accounts to create"
  type = map(object({
    account_tier = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    account_kind = optional(string, "StorageV2")
    access_tier = optional(string, "Hot")
    https_traffic_only_enabled = optional(bool, true)
    min_tls_version = optional(string, "TLS1_2")
    public_network_access_enabled = optional(bool, true)
    allow_nested_items_to_be_public = optional(bool, false)
    container_name = optional(string, "function-code")
    tags = optional(map(string), {})
  }))
}