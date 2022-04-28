resource "azurerm_cosmosdb_sql_role_assignment" "comosdb-role-assignment" {
  resource_group_name = var.service_settings.resource_group_name
  account_name        = var.service_settings.account_name
  role_definition_id  = var.service_settings.role_definition_id
  principal_id        = var.service_settings.principal_id
  scope               = var.service_settings.scope
}