
locals {

  # simple access to the resource we are monitoring
  resource_id = azurerm_application_insights.endpoint.id

}

# unhandled exceptions spike
module "app_exceptions" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.service_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Insights/Components"
    name      = "exceptions/count"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Count"
    sensitivity = "Low"
    severity    = 1
    dimensions  = []
  }

}

# failed requests spike
module "app_requests_failed" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.service_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Insights/Components"
    name      = "requests/failed"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Count"
    sensitivity = "Low"
    severity    = 1
    dimensions  = []
  }

}

# requests rate spike
module "app_requests_rate" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/metric-alert/dynamic/v1"

  context = var.context

  actions = {
    ids = var.service_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Insights/Components"
    name      = "requests/rate"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    sensitivity = "Low"
    severity    = 2
    dimensions  = []
  }

}

# response time > 1 second
module "app_response_time" {

  source = "git::https://onpoint-healthcare@dev.azure.com/onpoint-healthcare/infrastructure-modules/_git/azure//modules/services/monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.service_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.Insights/Components"
    name      = "requests/duration"
  }

  threshold = {
    operator    = "GreaterThan"
    aggregation = "Average"
    value       = 1000
    severity    = 2
    dimensions  = []
  }

}
