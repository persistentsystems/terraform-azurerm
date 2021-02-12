# Create a WAF policy for an Azure FrontDoor

This is a pretty thin wrapper around azurerm_frontdoor_firewall_policy, but it does take a list of objects
for the managed_rules and custom rules which makes them easier to specify in a .tfvar file and dynamically
change rules between lifecycles.

## Resources Created

- [azurerm_frontdoor_firewall_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/frontdoor_firewall_policy) - [API Documentation](https://docs.microsoft.com/en-us/rest/api/frontdoorservice/webapplicationfirewall/policies/createorupdate)

## Inputs

The input structure is fairly long and it's probably easier to directly look at variables.tf and main.tf
as the module doesn't do much other than unwrap the lists into blocks.  The module does allow you to 
specify the rules as lists of objects which makes for easier configuration and manipulation of rulesets
for different environments.

## Ouputs
- id - WAF policy ID
- Name - WAF policy name

## Example Usage

```hcl
module "waf" {
    
    source = "../../../submodules/terraform-azurerm/services/frontdoor/policy/base/v1"
    
    context = local.context 
    service_settings = {
        enabled = true 
        policy = {
            custom_block_response_status_code = "403"
            custom_block_response_body        = "UmVxdWVzdCBOb3QgQXV0aG9yaXplZA==" # echo -n "Request Not Authorized" | base64
            mode                              = "Prevention"
            redirect_url                      = "https://YourErrorPage.domain.com" 
        }
        managed_rulesets = [
            {        
                type     = "DefaultRuleSet"
                version  = "1.0"   
            },
            {        
                type     = "Microsoft_BotManagerRuleSet"
                version  = "1.0"   
            }
        ]
        custom_rules = [
            {
                name                            = "GEOLocationFilter"
                enabled                         = true
                priority                        = 1
                rate_limit_duration_in_minutes  = 1
                rate_limit_threshold            = 10
                type                            = "MatchRule"
                action                          = "Allow"
                match_variable     = "RemoteAddr"
                operator           = "GeoMatch"
                negation_condition = false
                # Only Allow traffic from US and India into front door.
                match_values       = ["US", "IN"]
            }
        ]
    }
}
```
