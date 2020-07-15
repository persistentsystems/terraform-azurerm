
module "api_hosting_plan" {
  
  source                  = "github.com/markti/tf_azure_appservice/plan/premium"

  application_name                = var.context.application_name
  environment_name                = var.context.environment_name
  
  name                    = "${var.context.application_name}-${var.context.environment_name}-plan-${var.context.location_suffix}"
  resource_group_name     = var.context.resource_group_name
  location                = var.context.location

  storage_type            = var.storage_type

  maximum_instance_count  = var.maximum_instance_count
  minimum_instance_count  = var.minimum_instance_count

}