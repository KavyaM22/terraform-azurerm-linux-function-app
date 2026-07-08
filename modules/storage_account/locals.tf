locals {
  storage_account_name = lower(
    replace("${var.environment}${var.project_name}sa", "-", "")
  )
}