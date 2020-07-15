

module "appinsights" {
  
  source           = "../../../../../../../services/app-insights/endpoint/base/v1"

  context          = var.context

  service_settings = {
    name           = "${var.context.application_name}-${var.context.environment_name}-${var.context.location_suffix}"
    retention_days = 90
  }

}