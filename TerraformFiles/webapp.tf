resource "azurerm_service_plan" "example" {
  name                = "my-appserviceplan-my-ado-demo-${lower(var.environment)}"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "F1"
  depends_on          = [azurerm_mssql_database.db]
}



#Create an App under the AppService Plan

resource "azurerm_linux_web_app" "example" {
  name                = "my-service-my-ado-demo-${lower(var.environment)}"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name} Database=${azurerm_mssql_database.db.name};User ID=${azurerm_mssql_server.server.administrator_login};Password=${azurerm_mssql_server.server.administrator_login_password};Trusted_Connection=False;Encrypt=True;"
  }

  site_config {
    always_on = false

    application_stack {
      dotnet_version = "6.0"
    }
  }
}
