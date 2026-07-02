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

variable "tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "FunctionApp"
  }
}