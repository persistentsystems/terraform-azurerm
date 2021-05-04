
resource "azurerm_cosmosdb_sql_container" "container" {

 
  resource_group_name = var.context.resource_group_name
  account_name        = var.service_settings.account_name
  database_name       = var.service_settings.database_name
  name                = var.service_settings.name
  partition_key_path  = var.service_settings.partition_key_path

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    # Automatically added by Azure, causes infinite rebuilds
    # https://github.com/terraform-providers/terraform-provider-azurerm/issues/8798
    #excluded_path {
    #  path = "/\"_etag\"/?"
    #}
  }
/*
  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
*/  
}
