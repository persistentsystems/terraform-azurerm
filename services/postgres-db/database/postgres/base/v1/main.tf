resource "azurerm_postgresql_flexible_server_database" "postgresdb" {
  name      = var.service_settings.name
  server_id = var.service_settings.server_id
  collation = var.service_settings.collation
  charset   = var.service_settings.charset
}