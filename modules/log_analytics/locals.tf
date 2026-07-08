locals {

  workspace_name = lower(
    replace("${var.environment}-${var.project_name}-law", "_", "")
  )

}