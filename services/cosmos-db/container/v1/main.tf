
resource "azurerm_cosmosdb_sql_container" "erx" {

 
  resource_group_name = var.context.resource_group_name
  account_name        = var.service_settings.account_name
  database_name       = var.service_settings.database.name
  name                = var.container.name
  partition_key_path  = var.container.partition_key_path

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
/*
  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
*/  
}