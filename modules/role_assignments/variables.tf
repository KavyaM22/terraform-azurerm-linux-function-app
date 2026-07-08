variable "function_principal_id" {
  description = "Managed Identity Principal ID of the Function App"
  type        = string
}

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