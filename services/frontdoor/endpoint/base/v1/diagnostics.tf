
module "frontdoor_diagnostics" {

  source = "../../../../../services/monitor/diagnostics/base/v1"


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
