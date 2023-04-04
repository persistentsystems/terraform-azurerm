output "workflow_id" {
    value = azurerm_logic_app_workflow.logicapp.id
}

output "workflow_endpoint" {
  value = azurerm_logic_app_workflow.logicapp.access_endpoint
}