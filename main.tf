module "storage_account" {
  source = "./modules/storage_account"
  environment         = var.environment
  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  storage_accounts = {
    function = {}
  }
}