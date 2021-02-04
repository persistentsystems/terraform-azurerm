
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_api_management.apim.id

}


module "apim_capacity" {

  source = "../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.ApiManagement/service"
    name      = "Capacity"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 90
    severity    = 1
    dimensions  = []
  }

}

module "apim_duration" {

  source = "../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.ApiManagement/service"
    name      = "Duration"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 3000
    severity    = 1
    dimensions  = []
  }

}


module "apim_bad_requests" {

  source = "../../../../../services/monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.ApiManagement/service"
    name      = "Requests"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Total"
    sensitivity = "Medium"
    severity    = 1
    dimensions  = [
      {
        name = "GatewayResponseCodeCategory",
        operator = "Include",
        values = [ "4xx" ]
      }
    ]
  }

}
