variable "resource_group_name" {
  description = "Existing Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)

  default = {
    ManagedBy = "Terraform"
  }
}