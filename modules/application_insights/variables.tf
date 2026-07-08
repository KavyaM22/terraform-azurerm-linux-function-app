variable "environment" {
  description = "Environment name"
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

variable "workspace_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

variable "tags" {
  description = "Tags"

  type = map(string)

  default = {}
}