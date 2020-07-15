
module "api_hosting_plan" {
  
  source                  = "../../../../../services/app-service/plan/premium/base/v1"

  context                = var.context
  
  service_settings = {
    name                    = "${var.context.application_name}-${var.context.environment_name}-plan-${var.environment.location_suffix}"
    size                    = "EP1"
    storage_type            = var.storage_type
    maximum_instance_count  = var.maximum_instance_count
    minimum_instance_count  = var.minimum_instance_count
  }
}