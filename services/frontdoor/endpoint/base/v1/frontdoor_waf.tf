resource "azurerm_frontdoor_firewall_policy" "waf" {
  name                              = "${var.context.app_name}-${var.context.env_name}-wafpolicy"
  resource_group_name               = var.context.resource_group_name
  enabled                           = true
  mode                              = "Prevention"
  redirect_url                      = "https://www.example.com"
  custom_block_response_status_code = 403
  custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="

  managed_rule {
      type    = "DefaultRuleSet"
      version = "1.0"
    }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }  
}