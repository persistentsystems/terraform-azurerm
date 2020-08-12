resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.service_settings.name}-wafpolicy"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}