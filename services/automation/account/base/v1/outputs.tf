output "account_name" {
  value = azurerm_automation_account.account.name
}

output "account_id" {
  value = azurerm_automation_account.account.id
}

output "principal_id" {
  value = azurerm_automation_account.account.identity.0.principal_id
}
