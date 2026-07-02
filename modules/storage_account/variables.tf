variable "storage_account_name" {
  description = "Storage Account name"
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

variable "container_name" {
  description = "Blob container for Function App packages"
  type        = string
  default     = "function-code"
}

variable "tags" {
  description = "Tags applied to Storage Account"

  type = map(string)

  default = {}
}