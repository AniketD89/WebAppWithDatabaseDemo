# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}



# Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "mydemoado-${var.environment}-${random_string.myrandom.id}"
  location = var.region
}
