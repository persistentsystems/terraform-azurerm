output "id" {
  value = azurerm_frontdoor.frontdoor.id
}

output "waf_id" {
  value = azurerm_frontdoor_firewall_policy.waf.id
}