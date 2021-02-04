data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_api_management.apim.id
}

module "apim_diagnostics" {

  source = "../../../../monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_api_management.apim.name
    resource_id = azurerm_api_management.apim.id
    logs        = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
    metrics     = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics 

  }

}