resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = var.service_settings.name
  resource_group_name               = var.context.resource_group_name
  enabled                           = true
  custom_block_response_status_code = var.policy_settings.custom_block_response_status_code
  custom_block_response_body        = var.policy_settings.custom_block_response_body
  mode                              = var.policy_settings.mode
  redirect_url                      = var.policy_settings.redirect_url

  dynamic "managed_rule" {
    for_each = var.managed_rules_settings
	
	content {
	    type = managed_rule.values.managed_rules_settings.type
		version = managed_rule.values.managed_rules_settings.version
		}
	}
  
  tags = {
    app = var.context.application_name
    env = var.context.environment_name
     }  
}