locals {

  application_insights_name = lower(
    replace("${var.environment}${var.project_name}appi", "-", "")
  )

}