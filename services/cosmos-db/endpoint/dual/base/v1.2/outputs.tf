output "id" {
    value = azurerm_cosmosdb_account.account.id
}

output "name" {
    value = azurerm_cosmosdb_account.account.name
}

output "endpoint" {
    value = azurerm_cosmosdb_account.account.endpoint
}

output "master_key" {
    value = azurerm_cosmosdb_account.account.primary_master_key
}

output "readonly_master_key" {
    value = azurerm_cosmosdb_account.account.primary_readonly_master_key
}

output "connection_strings" {
    value = azurerm_cosmosdb_account.account.connection_strings
}