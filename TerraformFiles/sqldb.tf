
resource "azurerm_mssql_server" "server" {
  name                         = "my-service-my-ado-demo-db-server-${lower(var.environment)}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = "12.0"
}

resource "azurerm_mssql_database" "db" {
  name                        = "my-service-my-ado-demo-db-${lower(var.environment)}"
  server_id                   = azurerm_mssql_server.server.id
  sku_name                    = "GP_S_Gen5_1"
  storage_account_type        = "Local"
  zone_redundant              = false
  max_size_gb                 = "2"
  auto_pause_delay_in_minutes = "60"
  geo_backup_enabled          = false
  min_capacity                = 1


}


#Allow access to Azure services can be enabled by setting start_ip_address and end_ip_address to 0.0.0.0

resource "azurerm_mssql_firewall_rule" "example" {
  name             = "AllowAccessToAzureServices"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
