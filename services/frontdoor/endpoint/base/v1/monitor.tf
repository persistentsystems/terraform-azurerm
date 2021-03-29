
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_frontdoor.frontdoor.id

}

module "frontdoor_health" {

  source = "../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Network/frontdoors"
    name      = "BackendHealthPercentage"
  }

  threshold = {
    operator    = "LessThan"
    aggregation = "Average"
    value       = 90
    severity    = 1
    dimensions  = []
  }

}

module "frontdoor_4xx_requests" {

  source = "../../../../../services/monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Network/frontdoors"
    name      = "RequestCount"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Total"
    sensitivity = "Medium"
    severity    = 1
    dimensions  = [
      {
        name = "HttpStatus",
        operator = "Include",
        values = [ "400", "401", "403", "404" ]
      }
    ]
  }

}

module "frontdoor_latency" {

  source = "../../../../../services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Network/frontdoors"
    name      = "BackendRequestLatency"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 1000
    severity    = 1
    dimensions  = []
  }

}