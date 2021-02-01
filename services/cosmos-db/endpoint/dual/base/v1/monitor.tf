
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_cosmosdb_account.account.id

}


module "cosmos_service_latency" {

  source = "../../../../../monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.DocumentDB/databaseAccounts"
    name      = "ServerSideLatency"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 10
    severity    = 1
    dimensions  = []
  }

}

module "cosmos_total_request_units" {

  source = "../../../../../monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.DocumentDB/databaseAccounts"
    name      = "TotalRequestUnits"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    sensitivity = "Medium"
    severity    = 1
    dimensions  = []
  }

}

module "cosmos_normalized_ru_consumption" {

  source = "../../../../../monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.DocumentDB/databaseAccounts"
    name      = "NormalizedRUConsumption"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 90
    severity    = 1
    dimensions  = []
  }

}

module "cosmos_4xx_requests" {

  source = "../../../../../monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.DocumentDB/databaseAccounts"
    name      = "TotalRequests"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Count"
    sensitivity = "Medium"
    severity    = 1
    dimensions  = [
      {
        name = "StatusCode",
        operator = "Include",
        values = [ "400", "401", "403", "404", "429" ]
      }
    ]
  }

}
