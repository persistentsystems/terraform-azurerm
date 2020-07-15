
module "api_hosting_plan" {
  
  source                  = "github.com/markti/tf_azure_appservice/plan/premium"

  app_name                = var.environment.app_name
  env_name                = var.environment.env_name
  
  name                    = "${var.environment.app_name}-${var.environment.env_name}-plan-${var.environment.location_suffix}"
  resource_group_name     = var.environment.resource_group_name
  location                = var.environment.location

  storage_type            = var.storage_type

  maximum_instance_count  = var.maximum_instance_count
  minimum_instance_count  = var.minimum_instance_count

}