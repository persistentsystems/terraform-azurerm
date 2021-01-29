
module "keyvault_diagnostics" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_key_vault.keyvault.name
    resource_id = azurerm_key_vault.keyvault.id

    logs        = [ "AuditEvent" ]
    metrics     = [ "AllMetrics" ]

  }

}