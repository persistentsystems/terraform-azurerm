#
# Log Analytics Workspace
#
module log_analytics {
    source = "../../services/log-analytics/workspace/base/v1"
    context = module.my_resource_group.context 
    service_settings = {
        name = "${module.my_resource_group.context.application_name}-${module.my_resource_group.context.environment_name}-workspace-${module.my_resource_group.context.location_suffix}"
        retention_in_days = 30
    }
}

# 
# App Insights
#
module "appinsights" {
  
  source           = "../../services/app-insights/endpoint/base/v1"

  context          = module.my_resource_group.context

  service_settings = {
    name           = "${module.my_resource_group.context.application_name}-${module.my_resource_group.context.environment_name}-${module.my_resource_group.context.location_suffix}"
    retention_days = 30
  }

}

# 
# Log Storage Account
#

module "logs_storage" {
  
  source = "../../services/storage/endpoint/base/v1.2"

  context = module.my_resource_group.context

  service_settings = {
    name                = "logretention"
    tier                = "Standard"
    type                = "LRS"  # RAGRS or something better for production use
  }

}

# 
# Log Storage Container
#
module "appinsight_container" {
  source  = "../../services/storage/blob/container/base/v1"
  name    = "logretention"
  storage_account_name = module.logs_storage.name
}

# This can be passed to anything wanting observability_settings
locals {
    observability_settings = {
        instrumentation_key = module.appinsights.instrumentation_key
        workspace_id        = module.log_analytics.id 
        workspace_name      = module.log_analytics.name 
        storage_account     = module.logs_storage.id
        retention_days = 0
    }
}
