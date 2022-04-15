output "mssql_name" {
  value = azurerm_mssql_server.mssql.name
}
output "mssql_id" {
  value = azurerm_mssql_server.mssql.id
}
output "administrator_login" {
  value = azurerm_mssql_server.mssql.administrator_login
}
output "administrator_login_password" {
  value = azurerm_mssql_server.mssql.administrator_login_password
}

output "principal_id" {
  value = azurerm_mssql_server.mssql.identity.0.principal_id
}
output "fully_qualified_domain_name" {
  value = azurerm_mssql_server.mssql.fully_qualified_domain_name
}
output "server_vulnerability_assessment_id" {

  value = azurerm_mssql_server_vulnerability_assessment.mssql_vulnerability.id

}