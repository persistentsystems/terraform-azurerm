output "name" {
  value = azurerm_template_deployment.managed_identity_rgt.outputs["identityName"]
}
output "id" {
  value = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourcegroups/${var.context.resource_group_name}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${var.service_settings.name}"
}
output "client_id" {
  value = azurerm_template_deployment.managed_identity_rgt.outputs["principalId"]
}