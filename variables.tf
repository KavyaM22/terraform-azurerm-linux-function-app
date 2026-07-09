variable "environment" {
  description = "Environment"
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

variable "sql_admin_password" {
  description = "SQL Admin Password"
  type        = string
  sensitive   = true
}

variable "sql_admin_username" {
  description = "SQL Server administrator username"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra Tenant ID"
  type        = string
}

variable "tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}