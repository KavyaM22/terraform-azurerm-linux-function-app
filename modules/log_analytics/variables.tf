variable "environment" {
  description = "Environment name (dev, dev2, pre, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
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
  description = "Tags applied to Log Analytics Workspace"

  type = map(string)

  default = {}
}