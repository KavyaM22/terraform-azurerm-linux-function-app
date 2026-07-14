variable "tags" {
  description = "Tags applied to all Data Factories"
  type        = map(string)
  default     = {}
}

variable "data_factories" {
  description = "Map of Azure Data Factories"
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    public_network_enabled = bool
    managed_virtual_network_enabled = bool

    github_configuration = optional(object({
      account_name    = string
      branch_name     = string
      git_url         = string
      repository_name = string
      root_folder     = string
    }))
  }))
}