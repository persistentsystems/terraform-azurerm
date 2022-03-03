output "id" {
    value = azurerm_postgresql_flexible_server.postgres_server.id
}

output "name" {
    value = azurerm_postgresql_flexible_server.postgres_server.name
}

output "fqdn" {
    value = azurerm_postgresql_flexible_server.postgres_server.fqdn
}
output "postgres_admin_login" {
  value = azurerm_postgresql_flexible_server.postgres_server.administrator_login
}
output "postgres_admin_password" {
  value = azurerm_postgresql_flexible_server.postgres_server.administrator_password
}