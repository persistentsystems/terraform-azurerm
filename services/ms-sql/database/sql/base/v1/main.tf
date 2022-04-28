locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}


resource "azurerm_mssql_database" "mssql-db" {
  name           = var.service_settings.name
  server_id      = var.service_settings.server_id
  collation      = var.service_settings.collation 
  max_size_gb    = var.service_settings.max_size_gb
  sku_name       = var.service_settings.sku_name
  auto_pause_delay_in_minutes = var.service_settings.auto_pause_delay_in_minutes
  min_capacity    = var.service_settings.min_capacity

  long_term_retention_policy  {
    weekly_retention  = var.long_term_retention_policy.weekly_retention
    week_of_year      = var.long_term_retention_policy.week_of_year
  }
  extended_auditing_policy {
    storage_endpoint                        = var.mssql_db_auditing_policy.storage_endpoint
    storage_account_access_key              = var.mssql_db_auditing_policy.storage_account_access_key
    storage_account_access_key_is_secondary = var.mssql_db_auditing_policy.storage_account_access_key_is_secondary
    retention_in_days                       = var.mssql_db_auditing_policy.retention_in_days
  }

  tags                      = local.final_tags

}

