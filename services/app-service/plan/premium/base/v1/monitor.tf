
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_app_service_plan.app_service_plan.id

}


module "plan_cpu_metric" {

  source = "../../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Web/serverfarms"
    name      = "CpuPercentage"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 90
    severity    = 1
    dimensions  = []
  }

}


module "plan_memory_metric" {

  source = "../../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Web/serverfarms"
    name      = "MemoryPercentage"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 90
    severity    = 1
    dimensions  = []
  }

}
