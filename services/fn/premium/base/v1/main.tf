
locals {
  required_settings = {
    "FUNCTIONS_WORKER_RUNTIME"          = var.service_settings.runtime_type,
    "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.observability_settings.instrumentation_key,
  }
  
  combined_settings = merge(local.required_settings, var.service_settings.app_settings)

  #### - Getting all the ips from used defined. API Management and other services like DataFactory
  # in the portal FunctionApp->Networking->Access Restrictions to see the output of this
 combined_ip_list = concat(var.ip_rules_settings.user_defined_iplist, var.ip_rules_settings.apim_iplist, var.ip_rules_settings.services_iplist)
  #### - Converting list to list of objects before passing to dynamic block
    ip_list = [
         for ip in local.combined_ip_list: {
              ip_address = ip
                     }
              ] 

}

resource "azurerm_function_app" "function_app" {

  name                       = "func-${var.service_settings.name}"
  location                   = var.context.location.name
  resource_group_name        = var.context.resource_group_name
  app_service_plan_id        = var.service_settings.plan
  storage_account_name       = module.func_storage.name
  storage_account_access_key = module.func_storage.primary_access_key
  version                    = var.service_settings.runtime_version
  app_settings               = local.combined_settings
  https_only                 = true

  site_config {

    pre_warmed_instance_count = 1
    dynamic "ip_restriction" {
      for_each = local.ip_list
        content {
            ip_address = ip_restriction.value.ip_address
            }
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}

module "func_storage" {
  
  source                = "../../../../../services/storage//endpoint//randomized//v1"
  context   = var.context

  service_settings = {
    name = "func"
    tier = "Standard"
    type = "RAGRS"
    security_settings = {
      allow_blob_public_access = false
      min_tls_version = "TLS1_2"
    }
  }

}

# This pause after resource creation wasn't documented as to Why, 
# I'm removing it pending we see an issue that needs it SteveD Feb 2021
# resource "time_sleep" "wait_30_seconds" {
#   depends_on = [azurerm_function_app.function_app]

#   create_duration = "30s"
# }

# # This resource will create (at least) 30 seconds after null_resource.previous
# resource "null_resource" "next" {
#   depends_on = [time_sleep.wait_30_seconds]
# }