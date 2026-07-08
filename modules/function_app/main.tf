resource "azurerm_linux_function_app" "this" {

  name                = local.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id = var.service_plan_id

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  https_only = true

  functions_extension_version = "~4"

# Creates a managed identity for the Function App, allowing it to securely access Azure resources without storing credentials.
  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true   # Keeps the Function App warm to reduce cold starts.

    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    WEBSITE_RUN_FROM_PACKAGE = "1" # Runs the app directly from a deployment package, which is the recommended deployment model.
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.application_insights_connection_string
    APPINSIGHTS_INSTRUMENTATIONKEY = var.application_insights_instrumentation_key
  }

  tags = var.tags
}