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

variable "service_plan_id" {
  description = "App Service Plan ID"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "storage_account_access_key" {
  description = "Primary Storage Account Access Key"
  type        = string
  sensitive   = true
}

variable "application_insights_connection_string" {
  description = "Application Insights Connection String"
  type        = string
  default     = null
}

variable "application_insights_instrumentation_key" {
  description = "Application Insights Instrumentation Key"
  type        = string
  default     = null
}

variable "tags" {
  description = "Resource Tags"

  type = map(string)

  default = {}
}