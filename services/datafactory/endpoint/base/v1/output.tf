output "ADF_ID" {
  value       = azurerm_data_factory.datafactory.id
  description = "The generated ID for the ADF created"
}

output "name" {
  value       = azurerm_data_factory.datafactory.name
  description = "The generated ID for the ADF created"
}

output "principal_id" {
  value = azurerm_data_factory.datafactory.identity.0.principal_id
}