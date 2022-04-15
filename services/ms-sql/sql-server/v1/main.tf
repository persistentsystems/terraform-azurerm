locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}

data "azurerm_client_config" "sql_current" {}

resource "azurerm_mssql_server" "mssql" {
  name                         = "${var.service_settings.name}-${random_string.random.result}"
  resource_group_name          = var.context.resource_group_name
  location                     = var.context.location
  version                      = var.service_settings.version
  administrator_login          = var.service_settings.administrator_login
  administrator_login_password = var.service_settings.administrator_login_password
  minimum_tls_version          = var.service_settings.minimum_tls_version
     azuread_administrator {
      login_username  = var.service_settings.azuread_administrator_login
      tenant_id       = data.azurerm_client_config.sql_current.tenant_id
      object_id       = data.azurerm_client_config.sql_current.object_id
    }
     identity {
        type = var.service_settings.identity
  }
    tags                      = local.final_tags
}

resource "azurerm_mssql_firewall_rule" "mssql_fw_rule" {
  name                = "Allowing Azure Services"
  server_id           = azurerm_mssql_server.mssql.id
  start_ip_address    = var.firewall_rule_settings.start_ip_address
  end_ip_address      = var.firewall_rule_settings.end_ip_address
}

##Enabling Auditing
resource "azurerm_mssql_server_extended_auditing_policy" "mssql_auditing_policy" {
  server_id                               = azurerm_mssql_server.mssql.id
  storage_endpoint                        = var.mssql_auditing_policy.storage_endpoint
  storage_account_access_key              = var.mssql_auditing_policy.storage_account_access_key
  storage_account_access_key_is_secondary = var.mssql_auditing_policy.storage_account_access_key_is_secondary
  retention_in_days                       = var.mssql_auditing_policy.retention_in_days
}

resource "azurerm_mssql_server_security_alert_policy" "mssql_security" {
  resource_group_name = var.context.resource_group_name
  server_name         = azurerm_mssql_server.mssql.name
  state               = "Enabled"
}


resource "azurerm_mssql_server_vulnerability_assessment" "mssql_vulnerability" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.mssql_security.id
  storage_container_path          = var.mssql_vulnerability.storage_container_path
  storage_account_access_key      = var.mssql_vulnerability.storage_account_access_key 
   recurring_scans {
    enabled                   = var.mssql_vulnerability.recurring_scans_enabled
    email_subscription_admins = var.mssql_vulnerability.recurring_email_subscription_admins
    emails = [
      var.mssql_vulnerability.recurring_emails
    ]
  }
}