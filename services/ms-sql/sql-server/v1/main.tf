
resource "azurerm_mssql_server" "mssql" {
  name                         = "var.service_settings.name"
  resource_group_name          = var.context.resource_group_name
  location                     = var.context.location
  version                      = var.service_settings.version
  administrator_login          = var.service_settings.administrator_login
  administrator_login_password = var.service_settings.administrator_login_password
  minimum_tls_version          = var.service_settings.minimum_tls_version  
     identity {
        type = var.service_settings.identity
  }
    tags                      = local.final_tags
}