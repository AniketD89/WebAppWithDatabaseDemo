output "RG_Id" {
  value = data.azurerm_resource_group.example.id
}

output "RG_Location" {
  value = data.azurerm_resource_group.example.location
}

output "ASP_Id" {
  value = azurerm_service_plan.example.id
}
