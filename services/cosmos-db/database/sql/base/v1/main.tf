resource "azurerm_cosmosdb_sql_database" "database" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  account_name        = var.service_settings.account_name
  throughput          = var.service_settings.throughput

}