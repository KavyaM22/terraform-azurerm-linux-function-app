resource "azurerm_mssql_server" "this" {

  name                = local.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  version = "12.0"

  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  tags = var.tags
}

resource "azurerm_mssql_database" "this" {

  name      = local.sql_database_name
  server_id = azurerm_mssql_server.this.id

  sku_name  = "Basic"

  collation = "SQL_Latin1_General_CP1_CS_AS"
}