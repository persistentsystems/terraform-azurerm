

locals {
    required_settings = {
      "FUNCTIONS_WORKER_RUNTIME"          = var.service_settings.runtime_type,
      "APPINSIGHTS_INSTRUMENTATIONKEY"    = var.observability_settings.instrumentation_key,
    }
    combined_settings = merge(local.required_settings, var.service_settings.app_settings)
  #### - Getting all the ips from used defined. API Management and other services like DataFactory
    combined_ip_list = concat(var.ip_rules_settings.user_defined_iplist, var.ip_rules_settings.apim_iplist, var.ip_rules_settings.services_iplist[var.context.location_suffix])
  #### - Converting list to list of objects before passing to dynamic block
    ip_list = [
         for ip in local.combined_ip_list: {
              ip_address = ip
                     }
              ]
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags )
}


# This will deploy an Azure Function to the target Resource Group / App Service Plan
resource "azurerm_function_app" "function_app" {
  name                      = var.service_settings.name
  location                  = var.context.location
  resource_group_name       = var.context.resource_group_name
  app_service_plan_id       = var.service_settings.plan_id
  storage_connection_string = var.service_settings.storage_account.connection_string
  version                   = var.service_settings.runtime_version 
  https_only                = true
  
  app_settings = local.combined_settings

  site_config {
    ftps_state  = var.ftps_state 
    pre_warmed_instance_count = 1
    use_32_bit_worker_process  = false
    ##It's enable the Health check to Functions
    health_check_path           = "/api/health"
    ip_restriction = {
      virtual_network_subnet_id = var.service_settings.virtual_network_subnet_id
      name                      = var.service_settings.restriction_name
      priority                  = var.service_settings.priority
      action                    = var.service_settings.action
    }
    # {
    #   virtual_network_subnet_id = var.service_settings.fn_virtual_network_subnet_id
    #   name                      = var.service_settings.fn_restriction_name
    #   priority                  = var.service_settings.fn_priority
    #   action                    = var.service_settings.fn_action
    # }
    
    
    
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

  tags = local.final_tags

}
resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_function_app.function_app]

  create_duration = "30s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}
##Currently Vnet Integration was not implemented to stagging slots.
# data "azurerm_subnet" "fn_integration" {
#   name                 = "${var.context.application_name}-${var.context.environment_name}-fn-subnet"
#   virtual_network_name = "${var.context.application_name}-${var.context.environment_name}-vnet"
#   resource_group_name  = var.context.resource_group_name
# }
# ##This block will turn on the Vnet Integration for function apps
# resource "azurerm_app_service_virtual_network_swift_connection" "function_app_vnet" {
#   app_service_id = azurerm_function_app.function_app.id
#   subnet_id      = data.azurerm_subnet.fn_integration.id
# }
