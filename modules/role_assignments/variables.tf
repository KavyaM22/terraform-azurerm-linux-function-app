variable "storage_account_id" {
  description = "Storage Account Resource ID"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault Resource ID"
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace Resource ID"
  type        = string
  default     = null
}

variable "principal_ids" {
  description = "Managed Identity Principal IDs"
  type = map(string)

}