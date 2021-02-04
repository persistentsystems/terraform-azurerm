
module "app_service_plan_diagnostics" {

  source = "../../../../../services/monitor/diagnostics/base/v1"

  context                 = var.context
  observability_settings  = var.observability_settings

  service_settings = {

    name        = azurerm_function_app.function_app.name
    resource_id = azurerm_function_app.function_app.id

    logs        = [ "FunctionAppLogs" ]
    metrics     = [ "AllMetrics" ]

  }

}
