variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Administrator username"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "SQL Administrator password"
  type        = string
  sensitive   = true
}

variable "public_network_access_enabled" {
  description = "Allow public access to the SQL Server"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}