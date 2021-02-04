
module "app_service_plan_diagnostics" {

  source = "../../../../../../services/monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_app_service_plan.app_service_plan.name
    resource_id = azurerm_app_service_plan.app_service_plan.id

    logs        = []
    metrics     = [ "AllMetrics" ]

  }

}
