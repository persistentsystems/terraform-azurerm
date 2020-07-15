
output "id" {
  value = azurerm_resource_group.rg.id
}

output "name" {
  value = azurerm_resource_group.rg.name
}
output "location" {
  value = azurerm_resource_group.rg.location
}

output "context" {
  value = {

    application_name    = var.context.application_name
    environment_name    = var.context.environment_name
    resource_group_name = azurerm_resource_group.rg.name
    location            = var.context.location
    location_suffix     = var.context.location_suffix

  }
}