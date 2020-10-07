
resource "azurerm_cosmosdb_sql_container" "erx" {

 
  resource_group_name = var.context.resource_group_name
  account_name        = var.service_settings.account_name
  database_name       = var.service_settings.database_name
  name                = var.service_settings.name
  partition_key_path  = var.service_settings.partition_key_path

  indexing_policy {
    indexing_mode = "consistent"

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