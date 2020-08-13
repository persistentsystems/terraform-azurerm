resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.service_settings.name}"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true

  managed_rule [{ 
        type    = var.managed_rules_settings.type
        version = var.managed_rules_settings.version
      }]
  
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}