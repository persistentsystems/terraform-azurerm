resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.service_settings.name}-wafpolicy"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true
  mode                              = "Prevention"
  redirect_url                      = "https://www.erx-fdb.com"
  custom_block_response_status_code = 403
  custom_block_response_body        = "cmVxdWVzdCBub3QgYXV0aG9yaXNlZCBlbmNvZGUK"

  managed_rule {
      type    = "DefaultRuleSet"
      version = "1.0"
    }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}