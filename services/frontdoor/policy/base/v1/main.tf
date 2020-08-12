resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.service_settings.name}"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true

  managed_rule = {
     type    = string
     version = string
  }
  
  custom_rule = {
    name        = string
    enabled     = bool
    priority    = number
    type        = string
    action      = string

    match_condition {
      match_variable     = string
      operator           = string
      negation_condition = bool
      match_values       = string
      }
  }
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}