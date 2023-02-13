locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags) 
}

resource "azurerm_log_analytics_solution" "sentinel" {
  solution_name         = "SecurityInsights"
  location              = var.context.location
  resource_group_name   = var.context.resource_group_name
  workspace_resource_id = var.service_settings.workspace_id
  workspace_name        = var.service_settings.workspace_name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
  tags = local.final_tags
}

# resource "azurerm_security_insights_sentinel_onboarding" "sentinel" {
#   resource_group_name  = var.context.resource_group_name
#   workspace_name       = var.service_settings.workspace_name
#   customer_managed_key = false
# }

# resource "azurerm_sentinel_data_connector_azure_security_center" "azure_security_center" {
#   name                       = "AzureSecurityCenter"
#   log_analytics_workspace_id = azurerm_log_analytics_solution.sentinel.workspace_resource_id
# }

