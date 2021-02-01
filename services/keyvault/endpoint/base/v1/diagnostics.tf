
module "keyvault_diagnostics" {

  source = "../../../../monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_key_vault.keyvault.name
    resource_id = azurerm_key_vault.keyvault.id

    logs        = [ "AuditEvent" ]
    metrics     = [ "AllMetrics" ]

  }

}