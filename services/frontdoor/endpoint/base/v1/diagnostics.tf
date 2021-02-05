
module "frontdoor_diagnostics" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_frontdoor.frontdoor.name
    resource_id = azurerm_frontdoor.frontdoor.id

    logs        = [ 
      "FrontdoorAccessLog", 
      "FrontdoorWebApplicationFirewallLog"
    ]
    metrics     = [ "AllMetrics" ]

  }

}
