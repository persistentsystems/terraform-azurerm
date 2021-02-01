
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_key_vault.keyvault.id

}


module "keyvault_availability" {

  source = "../../../../monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.KeyVault/vaults"
    name      = "Availability"
  }

  threshold = {
    operator    = "LessThan"
    aggregation = "Average"
    value       = 99
    severity    = 1
    dimensions  = []
  }

}

module "keyvault_4xx_requests" {

  source = "../../../../monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.KeyVault/vaults"
    name      = "ServiceApiResult"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Count"
    sensitivity = "Medium"
    severity    = 1
    dimensions  = [
      {
        name = "StatusCode",
        operator = "Include",
        values = [ "401", "403" ]
      }
    ]
  }

}
